import 'package:delivery/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.4,
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 14.0),
                onMapCreated: _onMapCreated,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 15),
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // big underscore
                    Container(
                      width: 35,
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: kGrey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Column(
                      children: [
                        Stepper(steps: [
                          Step(
                              state: StepState.editing,
                              isActive: true,
                              title: Text("Pick up"),
                              subtitle: Text("Armani shop"),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text("sdg"), Text("sgsdg")],
                              )),
                          Step(
                            isActive: true,
                            title: Text("Drop off"),
                            subtitle: Text("Jane chan"),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("sdg"), Text("sgsdg")],
                            ),
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
