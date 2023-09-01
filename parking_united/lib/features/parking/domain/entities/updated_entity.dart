import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UpdatedEntity extends Equatable {
  final num? CountedVehicles;
  final Timestamp? Time;
  final num? TotalCapacity;

  UpdatedEntity({this.CountedVehicles, this.Time, this.TotalCapacity});

  @override
  List<Object?> get props => [CountedVehicles, Time, TotalCapacity];

  factory UpdatedEntity.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;

    return UpdatedEntity(
        CountedVehicles: snap['CountedVehicles'],
        Time: snap['Time'],
        TotalCapacity: snap['TotalCapacity']);
  }

  factory UpdatedEntity.fromJson(Map<String, dynamic> json) {
    return UpdatedEntity(
        CountedVehicles: json['CountedVehicles'],
        Time: json['Time'],
        TotalCapacity: json['TotalCapacity']);
  }

  Map<String, dynamic> toDocument() => {
        "CountedVehicles": CountedVehicles,
        "Time": Time,
        "TotalCapacity": TotalCapacity
      };
}
