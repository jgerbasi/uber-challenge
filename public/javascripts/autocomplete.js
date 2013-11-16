$(document).ready(function() {
  $("#title-search").typeahead({
    name: 'titles',
    remote: '/autocomplete?term=%QUERY',
    limit: 15,
  });
})