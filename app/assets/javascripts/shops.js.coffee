# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ($) ->
  $data = $('#data')
  $('#create_chair').on 'click', (event) ->
    $('#num_of_chairs').text '…'

    url = $data.data('shop_chairs_path')
    $.ajax({
      type: 'POST',
      url: url
      success: (result, statuxText, xhr) ->
        $('#num_of_chairs').text result.size
        location.reload()
    })
