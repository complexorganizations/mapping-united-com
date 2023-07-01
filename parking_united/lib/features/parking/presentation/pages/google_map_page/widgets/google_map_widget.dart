import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "dart:async";
import "package:parking_united/features/parking/domain/entities/parking_entity.dart";
import "package:parking_united/features/parking/presentation/cubit/parking/parking_cubit.dart";
import "package:parking_united/features/parking/presentation/pages/google_map_page/widgets/bottom_model_sheet_container_widget.dart";

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  @override
  void initState() {
    BlocProvider.of<ParkingCubit>(context).getParking();
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParkingCubit, ParkingState>(
      builder: (context, parkingState) {
        if (parkingState is ParkingLoaded) {
          final parkingDetails = parkingState.parkingDetails;
          return GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(40.7128, -74.0060),
              zoom: 10.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: createCustomMarkers(
              parkingDetails: parkingDetails,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Set<Marker> createCustomMarkers(
      {required List<ParkingEntity> parkingDetails}) {
    final markers = <Marker>{};

    // Add custom markers to the set

    for (int i = 0; i < parkingDetails.length; i++) {
      markers.add(
        Marker(
            markerId: MarkerId(UniqueKey().toString()),
            position: LatLng(parkingDetails[i].address!.latitude,
                parkingDetails[i].address!.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            onTap: () {
              _showBottomModalSheet(context, parkingDetails[i]);
            }),
      );
    }

    return markers;
  }

  void _showBottomModalSheet(
      BuildContext context, ParkingEntity parkingDetails) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
      context: context,
      builder: (BuildContext context) {
        return BottomModelSheetContainerWidget(parkingDetails: parkingDetails);
      },
    );
  }
}
