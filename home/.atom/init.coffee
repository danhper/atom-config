remote = require 'remote'

remote.getCurrentWindow().setMenuBarVisibility(false)

runCommand = (command) ->
  workspaceElement = atom.views.getView(atom.workspace)
  process.nextTick ->
    atom.commands.dispatch workspaceElement, command

atom.packages.onDidActivatePackage (pack) ->
  return unless pack?.name == 'ex-mode'
  Ex = pack.mainModule.provideEx()
  Ex.registerCommand 'e', -> runCommand 'advanced-open-file:toggle'

atom.commands.add 'atom-workspace',
  'editor:focus-main': (e) ->
    atom.workspace.getActivePane().activate()
