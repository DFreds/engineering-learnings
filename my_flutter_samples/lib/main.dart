import 'package:flutter/material.dart';
import 'package:my_flutter_samples/network_request_list/network_request_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter Samples'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Network Request List'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return NetworkRequestList();
                }
              ));
            },
          ),
        ],
      ),
    );
  }
}



