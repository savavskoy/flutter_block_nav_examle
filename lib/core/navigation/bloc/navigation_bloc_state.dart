abstract class NavigationState {}

class HomeInitialState extends NavigationState {}

class SelectBirthYearScreenState extends NavigationState {
  final String selectedOption;

  SelectBirthYearScreenState({required this.selectedOption});
}

class ResultsScreenState extends NavigationState {
  final String birthYear;
  final String selectedOption;

  ResultsScreenState({required this.birthYear, required this.selectedOption});
}
