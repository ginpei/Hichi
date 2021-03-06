# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ($) ->
  $data = $('#data')
  $map = $('#map')
  $body = $('body')

  $('#edit_chairs').on 'click', (event) ->
    $body.toggleClass('edit-mode')

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

  isEditMode = ->
    $body.hasClass('edit-mode')

  offset = $map.offset()

  $chair = null
  targetId = null
  startLeft = null
  startTop = null
  startOffsetLeft = null
  startOffsetTop = null

  $map.on 'touchstart mousedown', (event) ->
    if targetId
      return

    data = getPointData(event, true)
    event.preventDefault() if data?.id and isEditMode()
    startMoving data

  $map.on 'touchmove mousemove', (event) ->
    unless targetId
      return

    move getPointData(event)

  $map.on 'touchend mouseup', (event) ->
    unless targetId
      return

    stopMoving event

  $map.on 'click', '.chair', (event) ->
    return if isEditMode()

    id = getChairId(event)
    return unless id

    $chair = $(event.target).closest('.chair')
    active = $chair.hasClass('active')
    data = { chair: { status:(if active then 1 else 0) } }
    updateChair id, data

    $chair.toggleClass('active', !active)

  getPointData = (event, detail) ->
    if detail
      id = getChairId(event)
      unless id
        return null

    event = event.originalEvent
    if (event.touches)
      touch = event.touches[0]
      left = touch.pageX
      top = touch.pageY
    else
      left = event.pageX
      top = event.pageY


    return { id, left, top }

  getChairId = (event) ->
    $chair = $(event.target).closest('.chair')
    id = $chair.data('id')

  startMoving = (data) ->
    unless isEditMode() and data?.id
      return

    targetId = data.id
    startLeft = data.left
    startTop = data.top

    $chair = $('#chair-' + targetId)
    position = $chair.position()
    startOffsetLeft = position.left
    startOffsetTop = position.top


  move = (data) ->
    left = data.left - startLeft + startOffsetLeft
    top = data.top - startTop + startOffsetTop
    $chair.css({ left, top })

  stopMoving = () ->
    position = $chair.position()
    data = { chair: { left:position.left, top:position.top } }

    # TODO use $data
    url = $('#data').data('shop_chairs_path') + '/' + targetId
    type = 'PUT'
    $.ajax({ data, type, url })

    targetId = null

  updateChair = (id, data) ->
    url = $data.data('shop_chairs_path') + '/' + id
    type = 'PUT'
    $.ajax({ data, type, url })
