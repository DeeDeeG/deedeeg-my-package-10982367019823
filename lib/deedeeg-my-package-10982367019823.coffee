DeedeegMyPackage10982367019823View = require './deedeeg-my-package-10982367019823-view'
{CompositeDisposable} = require 'atom'

module.exports = DeedeegMyPackage10982367019823 =
  deedeegMyPackage10982367019823View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @deedeegMyPackage10982367019823View = new DeedeegMyPackage10982367019823View(state.deedeegMyPackage10982367019823ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @deedeegMyPackage10982367019823View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'deedeeg-my-package-10982367019823:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @deedeegMyPackage10982367019823View.destroy()

  serialize: ->
    deedeegMyPackage10982367019823ViewState: @deedeegMyPackage10982367019823View.serialize()

  toggle: ->
    console.log 'DeedeegMyPackage10982367019823 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
