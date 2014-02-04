# this options model instance will
# represent the current filtering options
window.FF.Models.Filter = Backbone.Model.extend

  # default options
  defaults:
    fac: false
    coinsuranceMultiplier: .2
    quantity: 1
    modifier1: ''
    modifier2: ''
    year: 2014

  # FF.Models.Code
  code: null

  initialize: (options) ->
    _this = this

    # save reference to fees collection
    @code = options.code

    # notify user when options change
    @on 'change', _.bind(@_notifyOfChange, this)

  # get search attributes
  getFilterAttrs: () ->
    @pick 'fac', 'quantity', 'modifier1', 'modifier2', 'year'

  # event callback for notifying the user of a change
  _notifyOfChange: (model, options) ->
    if 'fac' of model.changed
      newlocation = (if model.changed.fac == true then 'Out of Office' else 'In Office')
      message = 'The location has been changed to <em>' + newlocation + '</em>.'
    if 'coinsuranceMultiplier' of model.changed
      message = 'The co-insurance multiplier has been changed to <em>' + parseInt(model.changed.coinsuranceMultiplier*100) + '%</em>.'
    if 'quantity' of model.changed
      message = 'The quantity has been changed to <em>' + model.changed.quantity + '</em>.'
    if 'modifier1' of model.changed
      message = 'Mod1 has been changed to <em>' + model.changed.modifier1 + '</em>.'
    if 'modifier2' of model.changed
      message = 'Mod2 has been changed to <em>' + model.changed.modifier2 + '</em>.'
    
    window.FF.notificationsRegion.show new window.FF.Views.NotificationInfo(message: message)

  toggleFac: () ->
    @set 'fac', not @get('fac')