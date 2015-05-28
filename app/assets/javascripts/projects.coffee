# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.create_task').click ->
    $('.modal.task').modal()
  $('.create_task_to_task').click (e) ->
    $('.task #task_parent_id').val($(e.currentTarget).data('task'))
    $('.modal.task').modal()

  $('.add_member').click ->
    $('.modal.member input').val('')
    $('.modal.member').modal()

  $('.edit_task').click ->
    $('.modal.edit_task').modal()




  $('.confirm_member').click ->
    email = $('.modal.member input').val()
    project_id =$('.modal.member .project_id').data('id')
    console.log email
    $.ajax(
      type: "POST"
      url:  "/projects/#{project_id}/member"
      data:
        email: email
        project_id: project_id
    ).done (response) ->
      console.log response
      window.location = "/projects/#{project_id}"