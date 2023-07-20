

import 'package:parking_united/features/parking/data/data_source/parking_remote_data_source.dart';
import 'package:parking_united/features/parking/data/data_source/parking_remote_data_source_impl.dart';
import 'package:parking_united/features/parking/data/repository/parking_repository_impl.dart';
import 'package:parking_united/features/parking/domain/repository/parking_repository.dart';
import 'package:parking_united/features/parking/domain/usecase/get_parking_usecase.dart';
import 'package:parking_united/features/parking/domain/usecase/get_parking_usecase.dart';
import 'package:parking_united/features/parking/presentation/cubit/parking/parking_cubit.dart';
import 'package:parking_united/main_injection_container.dart';

Future<void> parkingInjectionContainer() async {


  // * INJECTING CUBIT

  sl.registerFactory<ParkingCubit>(() => ParkingCubit(
    getParkingUseCase: sl.call()
  ));

  // * INJECTING USE CASES


  sl.registerLazySingleton<GetParkingUseCase>(
          () => GetParkingUseCase(repository: sl.call()));


  // * INJECTING REPOSITORY & REMOTE DATA SOURCE

  sl.registerLazySingleton<ParkingRepository>(
          () => ParkingRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<ParkingRemoteDataSource>(() => ParkingRemoteDataSourceImpl(
    fireStore: sl.call(),
  ));
}