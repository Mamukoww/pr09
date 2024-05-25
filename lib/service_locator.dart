import 'package:get_it/get_it.dart';
import 'product_manager.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ProductManager());
}
