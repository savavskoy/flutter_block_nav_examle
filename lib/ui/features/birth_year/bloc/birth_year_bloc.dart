import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_nav_examle/domain/models/bithday_data.dart';

import '../../../../core/data_result_processor.dart';
import '../../../../domain/use_cases/choose_user_birth_year/choose_user_birth_year_use_case.dart';
import 'birth_year_event.dart';
import 'birth_year_state.dart';

class BirthYearBloc extends Bloc<BirthYearEvent, BirthYearState> {
  final GetBirthdayDataUseCase getBirthdayDataUseCase;

  BirthYearBloc(this.getBirthdayDataUseCase) : super(BirthYearLoadingState()) {
    on<GetBirthdayDataEvent>((event, emit) => _onGetBirthYears(event, emit));
  }

  Future<void> _onGetBirthYears(event, emit) async {
    final birthdayDataResult = await getBirthdayDataUseCase.getBirthdayData();
    DataResultProcessor<BirthdayData>.processResult(
        dataResult: birthdayDataResult,
        onSuccess: (birthdayData) => emit(BirthYearLoadedState(years: birthdayData.years)),
        onError: (error) => emit(BirthYearErrorState(error: error)));
  }
}
