import 'package:parking_united/features/parking/data/data_source/parking_remote_data_source.dart';
import 'package:parking_united/features/parking/domain/entities/parking_entity.dart';
import 'package:parking_united/features/parking/domain/repository/parking_repository.dart';

class ParkingRepositoryImpl implements ParkingRepository {
  final ParkingRemoteDataSource remoteDataSource;

  ParkingRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<ParkingEntity>> getParkingDetails() =>
      remoteDataSource.getParkingDetails();
}
