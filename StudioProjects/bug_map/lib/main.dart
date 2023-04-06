// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

import 'map_page.dart';

void main(){
  GoogleMap.init('AIzaSyA9jVfg8BZ_8yn2sfadeGJQNuE06pz2v9I');

  runApp(const MyMap());
}

class MyMap extends StatelessWidget {
  const MyMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bug-Map',
      home: Scaffold(body: MapPage(),),
    );
  }
}
