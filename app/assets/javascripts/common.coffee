class @Common

  @fileUpload = ->
    $("#fileupload").fileupload
      dataType: 'script'
      formData:
        status: $("#fileupload").data('status')
      add: (e, data) ->
        data.context = $(tmpl("template-upload", data.files[0]))
        $(".upload_status").append data.context
        jqXHR = data.submit().success (result, textStatus, jqXHR) ->
          $('.upload_status .upload').remove()
      progress: (e, data) ->
        if (data.context)
          progress = data.loaded / data.total * 100
          progress = Math.floor(progress)
          $('.upload_status .progress').attr('aria-valuenow', progress)
          $('.upload_status .progress').css('display', 'block')
          $('.upload_status .progress-bar').css('width', progress + '%')