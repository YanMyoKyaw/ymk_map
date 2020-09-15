import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapLayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map with layers"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(16.8296146, 96.189117),
          zoom: 13.0,
        ),
        layers: [
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(16.8296146, 96.189117),
                builder: (ctx) =>
                Image(image: AssetImage('assets/ic_current_location.png')),
              ),
            ],
          ),
        ],
        children: <Widget>[
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(16.8296146, 96.189117),
                  builder: (ctx) =>
                  Image(image: AssetImage('assets/ic_current_location.png')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
