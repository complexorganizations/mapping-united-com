import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:parking_united/features/parking/domain/entities/car_parking_entity.dart";

class ShowParkingPage extends StatelessWidget {
  const ShowParkingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parking"),
      ),
      body: ListView(
        children: [
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: CarParkingEntity.carParking.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3),
              itemBuilder: (context, index) {
                final carItem = CarParkingEntity.carParking[index];
                return Container(
                  margin:
                      EdgeInsets.only(top: index == 0 || index == 1 ? 10 : 0),
                  child: DottedBorder(
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    strokeCap: StrokeCap.butt,
                    child: Container(
                      padding: EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${carItem.number}"),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(carItem.img!)
                        ],
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "OPENED",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "CLOSED",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/map_icon.png",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Open in Google Map",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
