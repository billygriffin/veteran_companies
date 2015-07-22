class LeadersForm

  constructor: (@$form) ->
    @$addButton = @$form.find('.add-new-leader-button')
    @$baseFormInputs = @$form.find('.leader-form-inputs').clone()
    @addListeners()

  addListeners: ->
    @$addButton.on('click', @addNewLeaderForm)

  addNewLeaderForm: =>
    $newInputs = @$baseFormInputs.clone()
    $newInputs.find('input').val('')
    @$addButton.before($newInputs)


jQuery ->
  $leadersForm = $('form#new_leader')
  new LeadersForm($leadersForm) if $leadersForm
