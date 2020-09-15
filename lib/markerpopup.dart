import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'component/popupWidget.dart';
import 'package:latlong/latlong.dart';

class MarkerPopup extends StatefulWidget{
  @override
  _MarkerPopupState createState() => _MarkerPopupState();
}

class _MarkerPopupState extends State{
  List<LatLng> points = [];
  final PopupController _popupController = PopupController();
  @override
  Widget build(BuildContext context) {
    var markers = points.map((point) =>
      Marker(
        point: point,
        width: 40,
        height: 40,
        builder: (_) => Icon(Icons.location_on, size: 40),
        anchorPos: AnchorPos.align(AnchorAlign.top),
      ),
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Marker popup"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(16.8296146, 96.189117),
          zoom: 15.0,
          plugins: [PopupMarkerPlugin()],
          onTap: (point) {
            setState(() {
              points.add(point);
            });
          },
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          PopupMarkerLayerOptions(
            markers: markers,
            popupSnap: PopupSnap.top,
            popupController: _popupController,
            popupBuilder: (BuildContext _, Marker marker) => PopupWidget(marker, "YMK Test"),
          ),
        ],
      ),
    );
  }
}