
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  // String _mapStyle;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: const {
        Marker(
          GeoCoord(22.764062, 75.898822),
        )
      },
      initialZoom: 13,
      initialPosition: const GeoCoord(22.764062, 75.898822),
      mapType: MapType.roadmap,

      interactive: true,
      mobilePreferences: const MobileMapPreferences(
        trafficEnabled: true,
        zoomControlsEnabled: false,
      ),
      webPreferences: const WebMapPreferences(
        fullscreenControl: true,
        zoomControl: true,
      ),
      onTap: (coordinate) {
        SnackBar(
          content: Text(
            coordinate.toString(),
          ),
          duration: const Duration(seconds: 2),
        );
      },

    );
  }
}
