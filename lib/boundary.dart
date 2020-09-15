import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MapBoundary extends StatefulWidget{
  @override
  _MapBoundaryState createState() => _MapBoundaryState();
}

class _MapBoundaryState extends State{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  getApi() async {
    var url = 'https://nominatim.openstreetmap.org/search.php?q=Mayangone&polygon_geojson=1&format=json';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
//      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: ${jsonResponse[0]['geojson']}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map With Boundary"),
      ),
      body: Center(
        child: Text("boundary"),
      ),
    );
  }
}