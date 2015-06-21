var pointLayer;

function displayFeatureInfo(map, pixel) {
  var feature = map.forEachFeatureAtPixel(pixel, function(feature, layer) {
    return feature;
  });


  
  if (feature) {
    $.get("/rodovia/" + feature.get("br"), function(data){
      $("#information").html(data);
    });
  }else{
    var position = map.getCoordinateFromPixel(pixel);

    map.removeLayer(pointLayer);

    var pointFeature = new ol.Feature({
      geometry: new ol.geom.Point(position),
      name: "Location Marker"
    });

    pointLayer = new ol.layer.Vector({
        source: new ol.source.Vector({
            features: [pointFeature]
        })
    });

    map.addLayer(pointLayer);
  }
}

function createVector(color, object){
  var item = new ol.layer.Vector({
     style: new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: color,
          width: 5
        }),
        fill: new ol.style.Fill({
          color: 'rgba(0, 0, 255, 0.1)'
        })
      }),
    source: new ol.source.GeoJSON({
      projection: 'EPSG:3857',
      object: object
    }),
  });
  return item;
}