FB.Router = Marionette.AppRouter.extend
  appRoutes:
    '': 'displaySearch'
    ':code': 'displayCode'

  
  # update google analytics
  navigate: (fragment, options) ->
    ga 'send', 'pageview', fragment
    Marionette.AppRouter::navigate.call this, fragment, options

# start Backbone history
FB.on 'initialize:after', ->
  Backbone.history.start pushState: true