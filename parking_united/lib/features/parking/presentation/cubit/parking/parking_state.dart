part of "parking_cubit.dart";

abstract class ParkingState extends Equatable {
  const ParkingState();
}

class ParkingInitial extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingLoading extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingLoaded extends ParkingState {
  final List<ParkingEntity> parkingDetails;

  const ParkingLoaded({required this.parkingDetails});
  @override
  List<Object> get props => [parkingDetails];
}

class ParkingFailure extends ParkingState {
  @override
  List<Object> get props => [];
}
