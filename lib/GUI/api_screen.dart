import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:photo_gallery/GUI/grid_view.dart';

class HomePage extends StatelessWidget {

  String api_key = "PhotosQuery";

  Future<List> fetchAds () async {
    final response = await http
        .get('https://alkafeel.net/alkafeelApps/arabicApp/apiExecuter.php?api=${api_key}',headers: {'Content-Type': 'application/json'});

    List data = [];
    if (response.statusCode == 200) {

      data = json.decode(response.body);
    }
    return data;
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("شبكة الكفيل",textAlign: TextAlign.center),
        backgroundColor: Colors.green[600],
      ),
      body: FutureBuilder(
          future: fetchAds(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text('Try again'),);
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Center(child: Text('Check internet connection'));
                return Grid_View(data: snapshot.data);
            } // unreachable
          }
      ),
      drawer: Drawer(),
    );
  }
}



/*
@mohammed_7aafar =>(instagram) => instagram.user;
#Flutter_Developer

 */