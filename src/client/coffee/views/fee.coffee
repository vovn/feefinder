window.FF.Views.Fee = Marionette.ItemView.extend
  className: 'col-xs-4'
  # transform certain model properties
  # to something more human friendly
  template: (model) ->
    _.template $('#tplFee').html(), _.extend model,
      amount: window.FF.String.toMoney model.amount