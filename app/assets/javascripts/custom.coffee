set_list_body = (title, data) ->
  new_title   = "<h1>Listing " + title + "</h1>"
  new_table   = ""
  if data?
    new_table = draw_table(data)
  out = new_title + new_table

draw_table = (table_data) ->
  table       = '<table class="table table-striped">'
  inner_table = for row_index, row_data of table_data
    draw_row(row_data)
  table += inner_table.join(' ') + '</table>'

draw_row = (row_data) ->
  row = "<tr><td>"
  out = for col_key, col_data of row_data
    if col_key == 'url'
      "<td><a href='" + col_data + "' class='btn btn-default'> Show </a></td>"
    else
      "<td>" + col_data + "</td>"
  row += out.join(' ') + '</td></tr>'

ready = ->
  $(".wysihtml5").wysihtml5()
  $.material.init()
  $(".withoutripple").on 'click', (event) ->
    that        = $(@)
    others      = that.parent().find('li.withoutripple')
    $.each others, (index, value) ->
      $(value).removeClass('active')
    that.addClass('active')
    $.ajax
      url: $(@).attr('data-remote')
      dataType: 'json'
      success: (data) ->
        body_page = $('#body_page')
        body_page.addClass('animated fadeOutDown')
        body_page.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', () ->
          body_page.empty()
          new_body  = set_list_body(that.html(), data)
          body_page.html(new_body)
          body_page.removeClass('animated fadeOutDown')
          body_page.addClass('animated fadeInUp')
        )

      error: (jqXHR, textStatus, errorThrown) ->
        console.log(textStatus)

$(document).ready(ready)
$(document).on('page:load', ready)
