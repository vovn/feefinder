window.FB.Router = Marionette.AppRouter.extend
  appRoutes:
    '': 'displaySearch'
    ':code': 'lookUpCode'

  
  # update google analytics
  navigate: (fragment, options) ->
    _gaq.push [
      '_trackPageview'
      fragment
    ]
    Marionette.AppRouter::navigate.call this, fragment, options