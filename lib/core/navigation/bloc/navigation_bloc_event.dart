abstract class NavigationEvent {}

class HomeScreenClicked extends NavigationEvent {
  final String option;

  HomeScreenClicked({required this.option});
}

class BirthDateScreenClicked extends NavigationEvent {
  final String selectedOption;
  final String birthYear;

  BirthDateScreenClicked(
      {required this.selectedOption, required this.birthYear});
}

class ResultsScreenClicked extends NavigationEvent {}
