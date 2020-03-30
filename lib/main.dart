import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MintCrisprApp());
}

class MintCrisprApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new KnownDeviceState();
  }
}

class KnownDeviceState extends State<MintCrisprApp> {
  var _isLoading = true;
  var devices;

  _fetchData() async {
    print("Fetching data from network!");

    final url = "localhost://devices.php";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      print(map);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Devices"),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                    new MaterialPageRoute(
                          builder: (context) => new DetailPage())
                    );
                  },
                )
              ],
            ),
            body: new Center(child: CircularProgressIndicator())));
  }
}


class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: new AppBar(
            title: new Text("Detail Page"),
          ),
          body: new Center(
            child: new Text("deety deet deet"),
          )
    );
  }
}