import 'package:flutter/material.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController  mapController; // to navigate  the map to particular location
  late String searchAddr;
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
