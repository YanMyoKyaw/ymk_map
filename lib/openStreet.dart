import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class OpenStreetPage extends StatefulWidget {
  @override
  _OpenStreetPageState createState() => _OpenStreetPageState();
}

class _OpenStreetPageState extends State<OpenStreetPage> {
  List<Polygon> _polygons = [];

  @override
  void initState() {
    super.initState();
    getApi();
  }

  getApi() async {
    var url = 'https://nominatim.openstreetmap.org/search.php?q=Hlaing&polygon_geojson=1&format=json';
//        'https://nominatim.openstreetmap.org/search.php?q=Mayangone&polygon_geojson=1&format=json';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var lnglat = jsonResponse[0]['geojson']['coordinates'];
      List<LatLng> points = [];
      lnglat.forEach((rootList) {
        rootList.forEach((lst){
          points.add(LatLng(lst[1],lst[0]));
        });
      });
      _polygons.add(Polygon(
        points: points,
        borderColor: Colors.blue,
        color: Colors.transparent,
        borderStrokeWidth: 3
//        holePointsList: points,
      ));
      print('object ${points}');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boundary"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(16.8660884, 96.1171103),
          zoom: 12.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(16.8660884, 96.1171103),
                builder: (ctx) =>
                    Image(image: AssetImage('assets/ic_current_location.png')),
              ),
            ],
          ),
          PolygonLayerOptions(
            polygons: _polygons,
          )
        ],
      ),
    );
  }
}
