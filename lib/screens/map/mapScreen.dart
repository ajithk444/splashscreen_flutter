import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key, this.title}) : super(key: key);
  final String title;
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);
  MapType _currentMapType = MapType.normal;

  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void changeMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void addMarkers() {
    setState(() {
      _markers.add(
        Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
        infoWindow: InfoWindow(
          title: 'Ajith',
          snippet: 'Maraimalai Nagar - Ford'
        )
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Live Map'),
            backgroundColor: Colors.green[700],
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: _currentMapType,
                markers: _markers,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                onCameraMove: _onCameraMove,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: changeMapType,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.map, size: 36.0),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        FloatingActionButton(
                          onPressed: addMarkers,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.supervised_user_circle,
                              size: 36.0),
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
//   GoogleMapController _mapController;
//   static final LatLng _initialPosition =
//       LatLng(37.42796133580664, -122.085749655962);

//   final CameraPosition _kGooglePlex = CameraPosition(
//     target: _initialPosition,
//     zoom: 14.4746,
//   );

//   Set<Marker> _createMarker() {
//     return <Marker>[
//       Marker(
//           markerId: MarkerId("marker_1"),
//           position: _initialPosition,
//           icon: BitmapDescriptor.defaultMarkerWithHue(
//             BitmapDescriptor.hueOrange,
//           )),
//     ].toSet();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         zoomGesturesEnabled: true,
//         myLocationButtonEnabled: true,
//         myLocationEnabled: true,
//         markers: _createMarker(),
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _mapController = controller;
//           setState(() {});
//         },
//       ),
//     );
//   }
// }
