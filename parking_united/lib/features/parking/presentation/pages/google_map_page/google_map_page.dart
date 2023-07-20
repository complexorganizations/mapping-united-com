import 'package:flutter/material.dart';
import 'package:parking_united/features/parking/presentation/pages/google_map_page/widgets/google_map_widget.dart';
import 'package:parking_united/features/parking/presentation/pages/show_parking/show_parking.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        title: Center(
          child: Text(
            "Parking United",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ShowParkingPage()));
            },
            child: Icon(
              Icons.local_parking,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: GoogleMapWidget(),
    );
  }
}
