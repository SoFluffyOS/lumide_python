# lumide_python

[![pub package](https://img.shields.io/pub/v/lumide_python.svg)](https://pub.dev/packages/lumide_python) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Powered by SoFluffy](https://img.shields.io/badge/Powered%20by-SoFluffy-orange)](https://sofluffy.io)

The official Python extension for [Lumide IDE](https://lumide.dev).

`lumide_python` provides first-class Python support in Lumide using the `Pyright` language server.

## Features

### 🛠 Language Support
- **IntelliSense**: High-accuracy code completions and type-checking suggestions.
- **Diagnostics**: Real-time linting, errors, and warnings highlighting.
- **Navigation**: Instant go-to-definition, find references, and symbol search.
- **Type Information**: Detailed hover information with documentation links.

### ⚡ Performance
- **Background Analysis**: Runs deep code analysis asynchronously to keep the UI snappy.
- **Project Awareness**: Understands `requirements.txt`, `pyproject.toml`, and virtual environments.

## Commands

Access these via the Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`):

| Command ID | Title | Description |
|---|---|---|
| `lumide_python.restartLsp` | **Python: Restart Language Server** | Restart the `pyright-langserver` process |

## Requirements

- **Python**: A Python environment must be installed.
- **Pyright**: The Microsoft Python language server.
    - **Installation**: `npm install -g pyright`
    - Ensure `pyright-langserver` is in your system `PATH`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with ❤️ by [SoFluffy](https://sofluffy.io).

## Happy Coding 🦊
