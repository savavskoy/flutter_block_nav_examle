import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_bloc_event.dart';
import 'navigation_bloc_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeInitialState()) {
    on<HomeScreenClicked>(
      (event, emit) =>
          emit(SelectBirthYearScreenState(selectedOption: event.option)),
    );
    on<BirthDateScreenClicked>(
      (event, emit) => emit(ResultsScreenState(
          birthYear: event.birthYear, selectedOption: event.selectedOption)),
    );
  }
}
