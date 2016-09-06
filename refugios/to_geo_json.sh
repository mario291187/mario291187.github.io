    map.addSource("places", {
        "type": "geojson",
        "data": {
         "type": "FeatureCollection",
  "features": [
    {
                "type": "Feature",
                "properties": {
                    "description": "<strong>Esc. Telesecundaria No. 29 Profra. Carmen Fisher</strong><p> Camino del Conejo, Col. Lomas del Sol I, Pedregal, Cabo San Lucas, B.C.S., Mexico</p>",
                    "icon": "circle"
                },
                "geometry": {
                  "type": "Point",
                    "coordinates": [-109.914882, 22.87987]
                }
            }
      ]
        }
    });
    map.addLayer({
        "id": "places",
        "type": "symbol",
        "source": "places",
        "layout": {
            "icon-image": "{icon}-15",
            "icon-allow-overlap": true
        }
        /*,
      'paint': {
                'icon-color': '#088'
      }*/
    });
