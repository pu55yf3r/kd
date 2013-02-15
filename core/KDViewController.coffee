class KDViewController extends KDController

  constructor:->

    super

    @setView @getOptions().view if @getOptions().view?

  loadView:(mainView)->

  getView:-> @mainView

  setView:(aViewInstance)->
    @mainView = aViewInstance
    @emit "ControllerHasSetItsView"
    cb = @loadView.bind @, aViewInstance
    if aViewInstance.isViewReady() then do cb
    else
      aViewInstance.on 'viewAppended', cb
      aViewInstance.on 'KDObjectWillBeDestroyed', => @destroy()