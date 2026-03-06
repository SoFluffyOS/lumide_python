/// Python language support plugin for Lumide IDE.
///
/// Registers Pyright as the language server for Python files.
library;

import 'package:lumide_api/lumide_api.dart';

void main() => PythonPlugin().run();

class PythonPlugin extends LumidePlugin {
  static const _logPrefix = '🐍';
  static const _defaultLspCommand = 'pyright-langserver';
  static const _pluginId = 'python-lsp';
  static const _languageId = 'python';
  static const _fileExtensions = ['.py', '.pyi'];
  static const _restartCommandId = 'lumide_python.restartLsp';
  static const _pluginName = 'Python';
  static const _lspArgs = ['--stdio'];

  String _lspCommand = _defaultLspCommand;

  @override
  Future<void> onActivate(LumideContext context) async {
    log('$_logPrefix $_pluginName plugin activated');

    final customPath =
        await context.workspace.getConfiguration('$_pluginId.path') as String?;
    if (customPath != null && customPath.trim().isNotEmpty) {
      _lspCommand = customPath.trim();
    }

    try {
      final checkCommand =
          _lspCommand == _defaultLspCommand ? 'pyright' : _lspCommand;
      final res = await context.shell.run(checkCommand, ['--version']);

      if (res.exitCode != 0) {
        if (!res.stderr.contains('Connection input stream is not set')) {
          throw Exception('Command not found or failed');
        }
      }
    } catch (e) {
      await context.window.showMessage(
        '$e',
        // '$_lspCommand is not installed. Please install it to enable $_pluginName language support.',
        title: _pluginName,
        type: MessageType.warning,
      );
      log('$_logPrefix $_lspCommand not found, aborting');
      return;
    }

    await context.languages.registerLanguageServer(
      id: _pluginId,
      languageId: _languageId,
      fileExtensions: _fileExtensions,
      command: _lspCommand,
      args: _lspArgs,
    );

    await context.commands.registerCommand(
      id: _restartCommandId,
      title: '$_pluginName: Restart Language Server',
      category: _pluginName,
      callback: ([args]) async {
        await context.languages.registerLanguageServer(
          id: _pluginId,
          languageId: _languageId,
          fileExtensions: _fileExtensions,
          command: _lspCommand,
          args: _lspArgs,
        );
        await context.window.showMessage(
          '$_pluginName language server restarted',
          title: _pluginName,
        );
      },
    );

    log('$_logPrefix $_pluginName registered for $_languageId files');
  }

  @override
  Future<void> onDeactivate() async {
    log('$_logPrefix $_pluginName plugin deactivated');
  }
}
