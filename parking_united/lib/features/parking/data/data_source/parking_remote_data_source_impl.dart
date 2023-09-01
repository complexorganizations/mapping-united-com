import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking_united/features/parking/data/data_source/parking_remote_data_source.dart';
import 'package:parking_united/features/parking/domain/entities/parking_entity.dart';

class ParkingRemoteDataSourceImpl implements ParkingRemoteDataSource {
  final FirebaseFirestore fireStore;

  ParkingRemoteDataSourceImpl({required this.fireStore});

  @override
  Stream<List<ParkingEntity>> getParkingDetails() {
    final parkingCollection = fireStore.collection("Parking");
    return parkingCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => ParkingEntity.fromSnapshot(e)).toList());
  }
}
