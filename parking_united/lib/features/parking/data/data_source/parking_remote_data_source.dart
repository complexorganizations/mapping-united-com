import "package:parking_united/features/parking/domain/entities/parking_entity.dart";

abstract class ParkingRemoteDataSource {
  Stream<List<ParkingEntity>> getParkingDetails();
}
