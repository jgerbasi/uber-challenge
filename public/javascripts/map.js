function initialize() {

  var mapOptions = {
    // Default center to SF
    center: new google.maps.LatLng(37.7749295, -122.4194155),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map($("#map-canvas")[0], mapOptions);
}

$(document).ready(function() {
  initialize();
})