import "package:cloud_firestore/cloud_firestore.dart";
import "package:equatable/equatable.dart";

class UpdatedEntity extends Equatable {
  final num? countedVehicles;
  final Timestamp? time;
  final num? totalCapacity;

  const UpdatedEntity({this.countedVehicles, this.time, this.totalCapacity});

  @override
  List<Object?> get props => [countedVehicles, time, totalCapacity];

  factory UpdatedEntity.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;

    return UpdatedEntity(
        countedVehicles: snap["CountedVehicles"],
        time: snap["Time"],
        totalCapacity: snap["TotalCapacity"]);
  }

  factory UpdatedEntity.fromJson(Map<String, dynamic> json) {
    return UpdatedEntity(
        countedVehicles: json["CountedVehicles"],
        time: json["Time"],
        totalCapacity: json["TotalCapacity"]);
  }

  Map<String, dynamic> toDocument() => {
        "CountedVehicles": countedVehicles,
        "Time": time,
        "TotalCapacity": totalCapacity
      };
}
