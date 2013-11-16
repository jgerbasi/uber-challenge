$(document).ready(function() {
  $("#title-search").autocomplete({
    source: '/locations',
    minLength: 3,
    autoFocus: false,
    delay: 100,
    messages: {
      noResults: '',
      results: function() {}
    },
  });
})