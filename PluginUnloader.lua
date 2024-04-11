local mq = require('mq')
local imgui = require 'ImGui'

local shouldRun = false
local isRunning = false


local excludedPlugins = {
    "mq2chatwnd",
    "mq2mmobugs"
}

local function getEnabledPlugins()
    local filePath = mq.configDir .. "\\MacroQuest.ini"
    local plugins = {}
    local inPluginsSection = false
    local file = io.open(filePath, "r")
    if not file then
        mq.print("Failed to open file: " .. filePath)
        return {}
    end

    for line in file:lines() do
        if line:match("^%[Plugins%]$") then
            inPluginsSection = true
        elseif line:match("^%[.*%]$") and inPluginsSection then
            inPluginsSection = false
        elseif inPluginsSection then
            local name, value = line:match("^(%w+)=(%d)$")
            if name and value == "1" then
                local lowercaseName = string.lower(name)
                local skip = false
                for _, excludedName in ipairs(excludedPlugins) do
                    if lowercaseName == excludedName then
                        skip = true
                        break
                    end
                end
                if not skip then
                    table.insert(plugins, name)
                end
            end
        end
    end

    file:close()
    return plugins
end


local function unloadPlugins(plugins)
    for _, plugin in ipairs(plugins) do
        mq.cmdf("/plugin %s unload", plugin)
        mq.delay(500) 
    end
end

local function pluginUnloaderGui()
    local buttonWidth = 280
    local buttonHeight = 50
    local windowWidth = buttonWidth + 20
    local windowHeight = buttonHeight + 60
    imgui.SetNextWindowSize(windowWidth, windowHeight) 
    if imgui.Begin("Plugin Unloader", true) then
        if imgui.Button("Start Unload", buttonWidth, buttonHeight) then
            shouldRun = true
        end
        imgui.End()
    end
end


local openGUI = true
ImGui.Register('GUIPluginUnload', function()
    openGUI = pluginUnloaderGui(openGUI)
end)


while true do
    if shouldRun and not isRunning then
        isRunning = true
        local pluginsToUnload = getEnabledPlugins()
        if #pluginsToUnload > 0 then
            print("Unloading enabled plugins...")
            unloadPlugins(pluginsToUnload)
            print("All specified plugins have been unloaded.")
        else
            print("No enabled plugins found to unload.")
        end
        shouldRun = false
        isRunning = false
    end
    mq.delay(100)
end
