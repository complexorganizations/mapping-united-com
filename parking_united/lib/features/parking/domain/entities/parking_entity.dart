import "package:cloud_firestore/cloud_firestore.dart";
import "package:equatable/equatable.dart";
import "package:parking_united/features/parking/domain/entities/updated_entity.dart";

class ParkingEntity extends Equatable {
  final GeoPoint? Address;
  final UpdatedEntity? Updated;

  ParkingEntity({this.Address, this.Updated});

  @override
  List<Object?> get props => [Address, Updated];

  factory ParkingEntity.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;

    return ParkingEntity(
        Address: snap["Address"],
        Updated: UpdatedEntity.fromJson(snapshot.get("Updated")));
  }

  Map<String, dynamic> toDocument() =>
      {"Address": Address, "Updated": Updated!.toDocument()};
}
