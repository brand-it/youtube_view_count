class VideoViews
  getVideoUsingAjax: (form) ->
    form = form
    data = $(form).serialize()
    $.ajax
      url: form.action
      data: data
      dataType: 'json'
      method: 'post'
    .done (data) ->
      details = document.getElementById('details')
      details.innerText = data.snippet.title + ' has a total of ' + data.statistics.viewCount + ' views'
$(document).on 'submit', '#video-views-form', (event) ->
  event.preventDefault()
  new VideoViews().getVideoUsingAjax(this)
