import "package:cloud_firestore/cloud_firestore.dart";
import "package:get_it/get_it.dart";
import "package:parking_united/features/parking/parking_injection_container.dart";

final sl = GetIt.instance;

Future<void> init() async {
  /// external
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => fireStore);

  await parkingInjectionContainer();
}
