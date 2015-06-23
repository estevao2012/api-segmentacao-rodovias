var pointLayer;

function displayFeatureInfo(map, pixel) {
  var feature = map.forEachFeatureAtPixel(pixel, function(feature, layer) {
    return feature;
  });

  if (feature) {
    $.get("/rodovias/" + feature.get("id"), function(data){
      $("#information").html(data);
    });
  }else{
    map.removeLayer(pointLayer);

    var position     = map.getCoordinateFromPixel(pixel);
    var point        = new ol.geom.Point(position);
    var pointFeature = new ol.Feature({
      geometry: point,
      name: "Location Marker"
    });

    pointLayer = new ol.layer.Vector({
      source: new ol.source.Vector({ features: [pointFeature] })
    });
    
    npoint = point.clone().transform('EPSG:3857', 'EPSG:4326');
    coord  = npoint.getCoordinates();

    $(".coord-x-form").val(coord[0]);
    $(".coord-y-form").val(coord[1]);

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

function createPoint(color, object){
  var item = new ol.layer.Vector({
    source: new ol.source.GeoJSON({
      projection: 'EPSG:3857',
      object: object
    }),
  });
  return item;
}