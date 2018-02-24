# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#snippets-table').dataTable
    
    serverSide: true
    ajax: $('#snippets-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'description'}
      {data: 'private'}
    
     
    ]