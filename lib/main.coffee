{CompositeDisposable} = require 'atom'

module.exports =
  disposables: null
  config:
    style:
      description: 'Color Style'
      type: 'string'
      default: 'orange'

  activate: (state) ->
    @disposables = new CompositeDisposable

    @disposables.add atom.config.observe 'afterglow-ui.style', (style) ->
      console.log 'adding style'
      styleOptions =
        ['afterglow-ui-orange', 'afterglow-ui-green', 'afterglow-ui-purple']
      body = document.querySelector('body')

      body.classList.remove('afterglow-ui-orange', 'afterglow-ui-green',
                            'afterglow-ui-purple')
      style ||= 'Orange'
      klass = "afterglow-ui-#{style}"
      return unless klass in styleOptions
      body.classList.add(klass)

  deactivate: -> @disposables?.dispose()

  addStyleClass: (style) ->
