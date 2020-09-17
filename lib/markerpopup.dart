import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'component/popupWidget.dart';
import 'package:latlong/latlong.dart';

class MarkerPopup extends StatefulWidget {
  @override
  _MarkerPopupState createState() => _MarkerPopupState();
}

class _MarkerPopupState extends State {
  List<LatLng> points = [];
  final PopupController _popupController = PopupController();
  @override
  Widget build(BuildContext context) {
    var markers = points
        .map(
          (point) => Marker(
            point: point,
            width: 40,
            height: 40,
            builder: (_) => Icon(Icons.location_on, size: 40),
            anchorPos: AnchorPos.align(AnchorAlign.top),
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Marker popup"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(16.8296146, 96.189117),
          zoom: 18.0,
          plugins: [PopupMarkerPlugin()],
          onTap: (point) {
            setState(() {
              points.add(point);
            });
          },
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/"
                "{id}/tiles/{z}/{x}/{y}?access_token={accessToken}"
                "&tileSize=512&zoomOffset=-1",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoieWFubXlvIiwiYSI6ImNrZjIzbnMxazB6NnQycm54em0zOHI0NWMifQ.SpQrfTrZaNKOApQH7-9_1Q',
              'id': 'mapbox/streets-v11',
            },
          ),
          PopupMarkerLayerOptions(
            markers: markers,
            popupSnap: PopupSnap.top,
            popupController: _popupController,
            popupBuilder: (BuildContext _, Marker marker) =>
                PopupWidget(marker, "YMK Test"),
          ),
        ],
      ),
    );
  }
}
