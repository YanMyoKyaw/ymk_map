import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'openStreet.dart';
import 'layers.dart';
import 'markerpopup.dart';
import 'boundary.dart';
import 'nominatimLocationPicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Buttonss(),
    );
  }
}

class Buttonss extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Desire button"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("Map With Boundary", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenStreetPage(),
                    )
                );
              },),
            RaisedButton(
              color: Colors.green,
              child: Text("Map With Markers", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarkerPopup(),
                    )
                );
              },),
            RaisedButton(
              color: Colors.green,
              child: Text("Map With Layers", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapLayers(),
                    )
                );
              },)
          ],
        ),
      ),
    );
  }
}
