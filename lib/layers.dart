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
                builder: (ctx) => Icon(Icons.location_on, size: 40),
              ),
            ],
          ),
        ],
        children: <Widget>[
          TileLayerWidget(
            // options: TileLayerOptions(
            //   urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            //   subdomains: ['a', 'b', 'c']
            // ),
            options: TileLayerOptions(
              urlTemplate: "https://api.mapbox.com/styles/v1/"
                  "{id}/tiles/{z}/{x}/{y}?access_token={accessToken}"
                  "&tileSize=512&zoomOffset=-1",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoieWFubXlvIiwiYSI6ImNrZjIzbnMxazB6NnQycm54em0zOHI0NWMifQ.SpQrfTrZaNKOApQH7-9_1Q',
                'id': 'mapbox/streets-v11',
              },
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(16.8296146, 96.189117),
                  builder: (ctx) => Icon(Icons.location_on, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
