import 'package:get_it/get_it.dart';
import 'package:pemilihan_app/model/model.dart';

import 'bloc/bloc.dart';
// import 'model/model.dart';
import 'service/service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  // Waiting for first launch
  locator.registerLazySingleton(() => CoreService(), instanceName: 'Service Core');
  locator.registerLazySingleton(() => AuthService(), instanceName: 'Service Auth');
  locator.registerLazySingleton(() => UserService.admin(), instanceName: 'Service Admin');
  locator.registerLazySingleton(() => UserService.pemantau(), instanceName: 'Service Pemantau');
  locator.registerLazySingleton(() => KecamatanService(), instanceName: 'Service Kecamatan');
  locator.registerLazySingleton(() => KelurahanService(), instanceName: 'Service Kelurahan');
  // locator.registerLazySingleton(() => CalonService(), instanceName: 'Service Calon');
  
  locator.registerFactory(() => TypeSelectionBloc());
  locator.registerFactory(() => LogInAdminBloc());
  locator.registerFactory(() => LogInPemantauBloc());
  locator.registerFactory(() => DataViewerBloc());
  locator.registerFactory(() => PemilihanTempatBloc());
  locator.registerFactory(() => InputDataBloc());

  locator.registerSingleton<Pemantau>(Pemantau.initial(), instanceName: 'Pemantau Active');
}

Future<void> awaitSetupLocator() async {
  
  await locator.allReady();

  // Setup service
  await locator<CoreService>(instanceName: 'Service Core').init();
}