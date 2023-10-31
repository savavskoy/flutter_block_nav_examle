import '../../../../domain/data_result/data_result.dart';

abstract class BirthYearState {}

class BirthYearLoadingState extends BirthYearState {}

class BirthYearLoadedState extends BirthYearState {
  final List<int> years;

  BirthYearLoadedState({required this.years});
}

class BirthYearErrorState extends BirthYearState {
  final ErrorResult error;

  BirthYearErrorState({required this.error});
}
