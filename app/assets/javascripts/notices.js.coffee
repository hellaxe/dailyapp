$('a.close').on('click', (e) ->
  $(e.target).parent().parent().fadeOut(1000)
)
