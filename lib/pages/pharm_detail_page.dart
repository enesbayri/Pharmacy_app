// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/services/app_location_service.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';
import 'package:flutter_application_23/widgets/appbar.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmacyDetailPage extends StatefulWidget {
  PharmacyDetailPage({super.key, required this.pharm});
  final PharmacyModel pharm;

  @override
  State<PharmacyDetailPage> createState() => _PharmacyDetailPageState();
}

class _PharmacyDetailPageState extends State<PharmacyDetailPage> {
  late GoogleMapController mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  PolylinePoints polylinePoints = PolylinePoints();

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
              title: widget.pharm.name,
            ),
            InkWell(
              onTap: () async{
                await launchWeb();
              },
              child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: ColorHelper.zwidgetMain,
                ),
                subtitle: Text(widget.pharm.address,
                    style: TextStyleHelper.loadingLabelTextStyle),
              ),
            ),
            widget.pharm.tel != ""
                ? InkWell(
                    onTap: () async {
                      await launchTel();
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: ColorHelper.zwidgetMain,
                      ),
                      subtitle: Text(widget.pharm.tel,
                          style: TextStyleHelper.loadingLabelTextStyle),
                    ),
                  )
                : Container(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorHelper.zwidgetMain, width: 3)),
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.pharm.latitude, widget.pharm.longitude),
                    zoom: 15,
                  ),
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  onMapCreated: onMapCreated,
                  myLocationEnabled: true,
                  markers: {
                    Marker(
                        markerId: MarkerId("PharmAdress"),
                        infoWindow: InfoWindow(title: widget.pharm.name),
                        position: LatLng(widget.pharm.latitude, widget.pharm.longitude),
                        icon: BitmapDescriptor.defaultMarker)
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Uri telLaunchUri(PharmacyModel pharm) => Uri(
        scheme: 'tel',
        path: pharm.tel.replaceAll("(", "").replaceAll(")", ""),
      );
  Uri webLaunchUri(PharmacyModel pharm) => Uri(
        scheme: 'https://www.google.com/maps/dir/${pharm.latitude},${pharm.longitude}',
        path: "https://www.google.com/maps/dir/${pharm.latitude},${pharm.longitude}",
      );    

  Future<void> launchTel() async {
    if (!await launchUrl(telLaunchUri(widget.pharm))) {
      throw Exception('Could not launch');
    }
  }

  Future<void> launchWeb() async {
      if (!await launchUrl(webLaunchUri(widget.pharm))) {
        throw Exception('Could not launch');
      }
  }
  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDPJBr9UwjM9xEWUNfoCqpCgmSLr71BLQA",
      PointLatLng(AppLocationService.appLatitude, AppLocationService.appLongitude),
      PointLatLng(widget.pharm.latitude , widget.pharm.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.pink,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }
}
