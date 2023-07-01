import "package:flutter/material.dart";
import "package:parking_united/features/parking/presentation/pages/google_map_page/widgets/google_map_widget.dart";

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        title: const Center(
          child: Text(
            "Parking United",
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
      body: const GoogleMapWidget(),
    );
  }
}
