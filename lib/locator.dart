import 'package:get_it/get_it.dart';
import 'package:resfast/service/navigation_service.dart';
import 'package:resfast/viewmodel/login_view_model.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  locator.registerLazySingleton(() => MyNavigationService());
  locator.registerLazySingleton(() => LoginViewModel());
}
