import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:space/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
