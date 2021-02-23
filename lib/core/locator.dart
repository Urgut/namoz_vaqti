import 'package:get_it/get_it.dart';
import 'package:namaz_vakitleri_app/core/services/prayServices.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => PrayServices());

// Alternatively you could write it if you don't like global variables
}
