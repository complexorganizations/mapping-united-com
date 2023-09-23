import "package:flutter/material.dart";
import "package:google_maps_webservice/geocoding.dart";
import "package:intl/intl.dart";
import "package:parking_united/features/core/api_key.dart";
import "package:parking_united/features/parking/domain/entities/parking_entity.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

class BottomModelSheetContainerWidget extends StatefulWidget {
  final ParkingEntity parkingDetails;
  const BottomModelSheetContainerWidget(
      {Key? key, required this.parkingDetails})
      : super(key: key);

  @override
  State<BottomModelSheetContainerWidget> createState() =>
      _BottomModelSheetContainerWidgetState();
}

class _BottomModelSheetContainerWidgetState
    extends State<BottomModelSheetContainerWidget> {
  String _formattedAddress = "";

  @override
  void initState() {
    _convertAddress(LatLng(widget.parkingDetails.Address!.latitude,
        widget.parkingDetails.Address!.longitude));
    super.initState();
  }

  Future _convertAddress(LatLng address) async {
    try {
      final geocoding = GoogleMapsGeocoding(apiKey: API_KEY);

      final userLocationData = await geocoding.searchByLocation(
          Location(lat: address.latitude, lng: address.longitude));

      setState(() {
        _formattedAddress = userLocationData.results.first.formattedAddress!;
      });
    } catch (error) {
      print(error);
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _bottomModelSheetContainerTextWidget(
              horizontal: 20, text: "$_formattedAddress"),
          SizedBox(
            height: 25,
          ),
          _bottomModelSheetContainerTextWidget(
              text:
                  "Updated: ${DateFormat("dd-MMMM-yyy").format(widget.parkingDetails.Updated!.Time!.toDate())}",
              horizontal: 5),
          SizedBox(
            height: 5,
          ),
          _bottomModelSheetContainerTextWidget(
              text:
                  "Total Capacity: ${widget.parkingDetails.Updated!.TotalCapacity}",
              horizontal: 25),
          SizedBox(
            height: 5,
          ),
          _bottomModelSheetContainerTextWidget(
              text:
                  "Counted Vehicles: ${widget.parkingDetails.Updated!.CountedVehicles}",
              horizontal: 22),
          SizedBox(
            height: 5,
          ),
          _bottomModelSheetContainerTextWidget(
              text: "Expected Capacity: 20", horizontal: 20),
        ],
      ),
    );
  }

  _bottomModelSheetContainerTextWidget(
      {required String text, required double horizontal}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: Text(
            "$text",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
