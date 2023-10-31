import 'package:get_it/get_it.dart';

import '../core/navigation/bloc/navigation_bloc.dart';
import '../data/dao/local_data_dao.dart';
import '../data/dao/local_data_dao_impl.dart';
import '../data/repositories/user/user_repository.dart';
import '../data/repositories/user/user_repository_impl.dart';
import '../domain/use_cases/choose_user_birth_year/choose_user_birth_year_use_case.dart';
import '../domain/use_cases/choose_user_birth_year/choose_user_birth_year_use_case_impl.dart';
import '../ui/features/birth_year/bloc/birth_year_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  _setupData();
  _setupDomain();
  _setupUi();
}

void _setupData() {
  locator.registerLazySingleton<LocalDataDao>(() => LocalDataDaoImpl());
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator<LocalDataDao>()));
}

void _setupDomain() {
  locator.registerLazySingleton<GetBirthdayDataUseCase>(
      () => GetBirthdayDataUseCaseImpl(locator<UserRepository>()));
}

void _setupUi() {
  locator.registerFactory<NavigationBloc>(() => NavigationBloc());
  locator.registerFactory<BirthYearBloc>(
      () => BirthYearBloc(locator<GetBirthdayDataUseCase>()));
}
