import 'package:parking_united/features/parking/domain/entities/parking_entity.dart';
import 'package:parking_united/features/parking/domain/repository/parking_repository.dart';

class GetParkingUseCase {
  final ParkingRepository repository;

  const GetParkingUseCase({required this.repository});

  Stream<List<ParkingEntity>> call() {
    return repository.getParkingDetails();
  }
}
