import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/config/birth_year_config.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/navigation/bloc/navigation_bloc_event.dart';
import '../../../../../core/navigation/bloc/navigation_bloc_state.dart';
import '../../../../../di/locator.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/styles/text_styles.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../results/view/screens/results_screen.dart';
import '../../bloc/birth_year_bloc.dart';
import '../../bloc/birth_year_event.dart';
import '../../bloc/birth_year_state.dart';

class BirthDateScreen extends StatefulWidget {
  final String selectedOption;

  const BirthDateScreen({super.key, required this.selectedOption});

  @override
  State<BirthDateScreen> createState() => _BirthDateScreenState();
}

class _BirthDateScreenState extends BaseState<BirthDateScreen> {
  int selectedYear = BirthYearConfig.currentYear;
  final navigationBloc = locator<NavigationBloc>();
  final birthYearBloc = locator<BirthYearBloc>();
  FixedExtentScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    birthYearBloc.add(GetBirthdayDataEvent());
    scrollController = FixedExtentScrollController(
        initialItem: selectedYear - BirthYearConfig.startYear);
  }

  @override
  void dispose() {
    navigationBloc.close();
    birthYearBloc.close();
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => navigationBloc,
        ),
        BlocProvider<BirthYearBloc>(
          create: (context) => birthYearBloc,
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            if (state is ResultsScreenState) {
              navigate(ResultsScreen(
                year: selectedYear.toString(),
                selectedOption: widget.selectedOption,
              ));
            }
          },
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.dateOfBirthScreenBgImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: _buildScreen(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          AppStrings.birthDateScreenTitle,
          style: AppTextStyles.nunitoMedium,
        ),
        _buildBirthDateSelection(),
        _buildButtonNext()
      ],
    );
  }

  Widget _buildBirthDateSelection() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 1.2,
      child: BlocBuilder<BirthYearBloc, BirthYearState>(
        builder: (context, state) {
          if (state is BirthYearLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.darkBlue,
            ));
          } else if (state is BirthYearLoadedState) {
            return _buildDatePicker(state.years);
          } else if (state is BirthYearErrorState) {
            return const Center(
                child: Text(
              AppStrings.loadingError,
              style: AppTextStyles.subtitleStyle,
            ));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildDatePicker(List<int> years) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: CupertinoPicker(
        scrollController: scrollController,
        itemExtent: 50,
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedYear = years[index];
          });
        },
        children: years.map<Widget>((year) {
          return Center(
            child: Text(
              '$year',
              style: AppTextStyles.dateSelectorStyle,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildButtonNext() {
    return CustomButton(
      title: AppStrings.nextButton,
      onTap: () {
        navigationBloc.add(
          BirthDateScreenClicked(
              birthYear: selectedYear.toString(),
              selectedOption: widget.selectedOption),
        );
      },
    );
  }
}
