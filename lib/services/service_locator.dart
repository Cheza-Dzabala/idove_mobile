import 'package:get_it/get_it.dart';
import 'package:idove/services/network/authentication_service.dart';
import 'package:idove/services/network/profile_service.dart';
import 'package:idove/services/storage/user_storage_service.dart';

GetIt locator = GetIt.instance;

setUpServiceLocator() {
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());

  locator.registerLazySingleton<UserStorageService>(() => UserStorageService());
  locator.registerLazySingleton<ProfileService>(() => ProfileService());
}
