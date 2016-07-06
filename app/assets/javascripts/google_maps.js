
var map;
var myLatLng = {lat: 40.603624, lng: -74.961102};
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 13
  });

  var customMapType = new google.maps.StyledMapType([
    {
      stylers: [
        {hue: '#ff0000'},
        {visibility: 'simplified'},
        {saturation: -100},
        {lightness: -10},
        {gamma: 0.5},
        {weight: 4.5}
      ]
    },
    {
      elementType: 'labels',
      stylers: [{visibility: 'on'}]
    },
    {
      featureType: 'poi',
      elementType: 'geometry',
      stylers: [{color: '#B6D094'}]
    },
    {
      featureType: 'water',
      stylers: [{color: '#698EA3'}]
    }
  ], {
    name: 'Custom Style'
  });
  var customMapTypeId = 'custom_style';
  map.mapTypes.set(customMapTypeId, customMapType);
  map.setMapTypeId(customMapTypeId);

  var contentString = '<div id="content">'+
    '<div id="siteNotice"></div>'+
    '<h1 id="firstHeading" class="firstHeading">Anderson Glass</h1>'+
    '<div id="bodyContent">'+
    '<p>Have a glass project? Anderson Glass LLC is your worry free solution. '+
    'Up to date with shower and bath industry trends and providing the '+
    'very best in glass and hardware products, Anderson Glass will '+
    'help increase your home’s value and your enjoyment.'+
    '</div>'+
    '</div>';

    var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Anderson Glass Company'
  });
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}
