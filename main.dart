import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loadData.dart';

Future<LoadData> apiCall() async {
  final response =
      await http.get('http://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Json API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Flutter Api"), backgroundColor: Colors.greenAccent),
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: Center(
                    child: Text(
              "Başlık :  ${snapshot.data.title}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.orange),
            )));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
