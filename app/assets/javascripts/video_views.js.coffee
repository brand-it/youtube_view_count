class VideoViews
  formatNumber: (number) ->
    # https://stackoverflow.com/questions/2901102/how-to-print-a-number-with-commas-as-thousands-separators-in-javascript
    # credit for this goes to stackoverflow again :D
    number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  getVideoUsingAjax: (form) ->
    self = this
    form = form
    data = $(form).serialize()
    $.ajax
      url: form.action
      data: data
      dataType: 'json'
      method: 'post'
    .done (data) ->
      details = document.getElementById('details')
      video_id = document.getElementById('video_view_video_id')
      if data
        video_id.classList.add('is-valid')
        details.innerText = data.snippet.title + '\n has a total of ' + self.formatNumber(data.statistics.viewCount) + ' views'
      else
        video_id.classList.add('is-invalid')
        details.innerText = "Sorry could not find the view cound for '#{video_id.value}'"
$(document).on 'submit', '#video-views-form', (event) ->
  event.preventDefault()
  new VideoViews().getVideoUsingAjax(this)
