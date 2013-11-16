window.markers = [];

function clearOverlays() {
  for (var i = 0; i < window.markers.length; i++ ) {
    window.markers[i].setMap(null);
  }
  window.markers = [];
}

function drawMarkers(markers) {
  for(var i = 0; i < markers.length; i++) {
    var loc = markers[i];
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(loc.latitude, loc.longitude),
      map: window.map,
      title: loc.title,
      icon: '/images/marker.png'
    });
    window.markers.push(marker);
  }
  // Center map on first marker
  if (window.markers.length > 0) {
    map.panTo(window.markers[0].getPosition());
  }
}

function initialize() {

  var mapOptions = {
    // Default center to SF
    center: new google.maps.LatLng(37.7749295, -122.4194155),
    zoom: 11,
    scrollwheel: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  window.map = new google.maps.Map($("#map-canvas")[0], mapOptions);

  $.getJSON( "/markers", function(results) {
    drawMarkers(results);
  });
}

$(document).ready(function() {

  initialize();

  // Event Handlers

  $("#btn-search").click(function() {
    var title = $("#title-search").val();
    var url = '/markers'
    if (title !== '') {
      $('#movie-title').html(title);
      url += '?title=' + title;
    }
    else {
      $('#movie-title').html('All Films');
    }
    $.getJSON(url, function(results) {
      clearOverlays();
      drawMarkers(results);
    }); 
  });

  $("#btn-reset").click(function() {
    clearOverlays();
    $('#movie-title').html('All Films');
    $.getJSON('/markers', function(results) {
      drawMarkers(results);
    })
  });

  $("#searchText").keyup(function(event){

    if (event.which === 13) {
      $("#searchButton").trigger("click");
     }  
  });
})