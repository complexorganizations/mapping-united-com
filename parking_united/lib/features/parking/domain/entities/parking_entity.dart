import "package:cloud_firestore/cloud_firestore.dart";
import "package:equatable/equatable.dart";
import "package:parking_united/features/parking/domain/entities/updated_entity.dart";

class ParkingEntity extends Equatable {
  final GeoPoint? address;
  final UpdatedEntity? updated;

  const ParkingEntity({this.address, this.updated});

  @override
  List<Object?> get props => [address, updated];

  factory ParkingEntity.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;

    return ParkingEntity(
        address: snap["Address"],
        updated: UpdatedEntity.fromJson(snapshot.get("Updated")));
  }

  Map<String, dynamic> toDocument() =>
      {"Address": address, "Updated": updated!.toDocument()};
}
