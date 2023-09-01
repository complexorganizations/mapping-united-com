import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parking_united/features/parking/domain/entities/parking_entity.dart';
import 'package:parking_united/features/parking/domain/usecase/get_parking_usecase.dart';

part 'parking_state.dart';

class ParkingCubit extends Cubit<ParkingState> {
  final GetParkingUseCase getParkingUseCase;

  ParkingCubit({required this.getParkingUseCase}) : super(ParkingInitial());

  Future<void> getParking() async {
    emit(ParkingLoading());

    try {
      final streamResponse = getParkingUseCase.call();

      streamResponse.listen((parkingDetails) {
        emit(ParkingLoaded(parkingDetails: parkingDetails));
      });
    } on SocketException {
      emit(ParkingFailure());
    } catch (_) {
      emit(ParkingFailure());
    }
  }
}
