ready = ->
  $(".wysihtml5").wysihtml5()

$(document).ready(ready)
$(document).on('page:load', ready)
