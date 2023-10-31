import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/navigation/bloc/navigation_bloc_event.dart';
import '../../../../../core/navigation/bloc/navigation_bloc_state.dart';
import '../../../../../di/locator.dart';
import '../../../../common/widgets/custom_listtile.dart';
import '../../../../common/widgets/spacing_widget.dart';
import '../../../birth_year/view/screens/birth_year_screen.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends BaseState<OptionScreen> {
  final navigationBloc = locator<NavigationBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    navigationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => navigationBloc,
        child: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            if (state is SelectBirthYearScreenState) {
              navigate(BirthDateScreen(selectedOption: state.selectedOption));
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.choiceScreenBgImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: _buildScreen(),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomListtile(
                  title: AppStrings.trackMyPeriod,
                  subtitle: AppStrings.trackMyPeriodSubtitle,
                  onTapAction: () {
                    navigationBloc.add(
                        HomeScreenClicked(option: AppStrings.trackMyPeriod));
                  },
                ),
                const SpacingWidget(height: 8),
                CustomListtile(
                  title: AppStrings.getPregnant,
                  subtitle: AppStrings.getPregnantSubtitle,
                  onTapAction: () {
                    navigationBloc
                        .add(HomeScreenClicked(option: AppStrings.getPregnant));
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
