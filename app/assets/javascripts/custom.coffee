menu_a_click = (link) ->
  that = $(link).parent()
  ul   = that.parent()
  for li, index in ul.children('li')
    $(li).removeClass('active')
  that.addClass('active')

menu_all_a_click = ->
  $("li.withoutripple a").on 'click', (event) ->
    menu_a_click($(this))

menu_li_click = ->
  for value, index in $("li.withoutripple")
    $(value).on 'click', (event) ->
      that = $(@)
      link = that.children('a').first()
      console.log(link)
      # link.trigger('click')

ready = ->
  $(".wysihtml5").wysihtml5()
  $.material.init()
  menu_all_a_click()
  # menu_li_click()
  return true

$(document).ready(ready)
$(document).on('page:load', ready)
