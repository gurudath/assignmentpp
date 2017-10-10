# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('#address').on 'cocoon:before-remove', (e, item) ->
	  $(item).closest('.nested-fields').next('input').remove()
	  $(item).closest('.nested-fields').remove()
	  return
	$('#phone').on 'cocoon:before-remove', (e, item) ->
	  $(item).closest('.nested-fields').next('input').remove()
	  $(item).closest('.nested-fields').remove()
	  return