# MacroQuest Plugin Unloader

This Lua script for MacroQuest provides a user-friendly interface to dynamically unload plugins based on the configurations in the `MacroQuest.ini` file. It features a GUI to initiate the unloading process and excludes certain specified plugins from being unloaded to maintain essential functionalities.

## Features

- **GUI Control**: Start the plugin unloading process through an ImGui-based GUI with a simple click.
- **Selective Unloading**: Automatically skips specified plugins to prevent unloading essential functionalities.
- **Case Insensitive Matching**: The script is robust against different case representations of plugin names.

## Prerequisites

- MacroQuest installed and set up correctly.
- Lua scripting support enabled in MacroQuest.

## Installation

1. **Download the Script**: Download the `PluginUnloader.lua` file from this repository.
2. **Place the Script**: Move the script into the `lua` directory within your MacroQuest installation. The exact path might vary based on your MacroQuest setup.

## Usage

To use the Plugin Unloader script, follow these steps:

1. **Start MacroQuest**: Launch MacroQuest as you normally would.
2. **Load the Script**: Ensure that the script is loaded by checking the MacroQuest console or script output. This could involve manually loading the script via a command depending on your MacroQuest configuration.
3. **Open the GUI**: Once the script is active, you should see a GUI window labeled "Plugin Unloader" within the MacroQuest interface.
4. **Unload Plugins**: Click the "Start Unload" button within the GUI to begin the process of unloading plugins. The window will display which plugins are being unloaded unless they are on the exclusion list.

### Excluding Plugins

By default, the script will not unload plugins named `mq2chatwnd` and `mq2mmobugs` in any case format. If you need to adjust which plugins are excluded:

- Open the `PluginUnloader.lua` script in a text editor.
- Modify the `excludedPlugins` table within the script to include or remove plugin names, ensuring they are in lowercase.

## Contributing

Feel free to fork this repository and submit pull requests with your enhancements. You can also open issues if you find bugs or have feature suggestions.

## License

Distribute and modify this script as you need according to the terms of your MacroQuest's licensing agreement. Be sure to comply with all community guidelines and legal restrictions associated with script usage within MacroQuest.

## Disclaimer

This script is provided as-is, and while it has been tested to ensure reliability, the user assumes all responsibility for its use. Always ensure your scripting activities comply with the rules and terms of service for MacroQuest and the games it interacts with.
