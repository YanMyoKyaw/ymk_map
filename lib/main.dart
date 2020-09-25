import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'openStreet.dart';
import 'layers.dart';
import 'markerpopup.dart';
import 'boundary.dart';

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

class Buttonss extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttonss> {
  bool change = false;
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
              child: Text(
                "Map With Boundary",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenStreetPage(),
                    ));
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                "Map With Markers",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarkerPopup(),
                    ));
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                "Map With Layers",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapLayers(),
                    ));
              },
            ),
            IconButton(
              icon: Icon(change ? Icons.ac_unit : Icons.menu),
              onPressed: () async {
                setState(() {
                  change = true;
                });
                final position = buttonMenuPosition(context);
                var selected = await showMenu(
                  context: context,
                  position: position,
                  items: [
                    const PopupMenuItem<String>(
                      value: 'harder',
                      child: Text('Working a lot harder'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'smarter',
                      child: Text('Being a lot smarter'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'starter',
                      child: Text('Being a self-starter'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'charter',
                      child: Text('Placed in charge of trading charter'),
                    ),
                  ],
                );
                setState(() {
                  change = false;
                });
                print("Selected $selected");
              },
            )
          ],
        ),
      ),
    );
  }

  RelativeRect buttonMenuPosition(BuildContext c) {
    final RenderBox bar = c.findRenderObject();
    final RenderBox overlay = Overlay.of(c).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }
}
