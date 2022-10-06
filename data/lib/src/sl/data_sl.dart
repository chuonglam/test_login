import 'package:data/src/sl/data_sl.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: r'$initDataGetIt')
void configureDataDependencies(final GetIt getIt) {
  $initDataGetIt(getIt);
}
