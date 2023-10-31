import 'package:flutter/material.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../common/styles/text_styles.dart';
import '../../../../common/widgets/spacing_widget.dart';

class ResultsScreen extends StatefulWidget {
  final String selectedOption;
  final String year;

  const ResultsScreen({super.key, required this.year, required this.selectedOption});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends BaseState<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.resultScreenBgImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: _buildScreen(),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(AppStrings.emptyText),
        Column(
          children: [
            const Text(
              AppStrings.resultsScreenChosen,
              style: AppTextStyles.titleStyle,
            ),
            const SpacingWidget(
              height: 12,
            ),
            Text(
              '${AppStrings.resultsScreenOptionPrefix}${widget.selectedOption}',
              style: AppTextStyles.subtitleStyle
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SpacingWidget(
              height: 8,
            ),
            Text(
              '${AppStrings.resultsScreenYearPrefix}${widget.year}',
              style: AppTextStyles.subtitleStyle
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            AppStrings.resultsScreenThankYou,
            style: AppTextStyles.nunitoMedium,
          ),
        )
      ],
    );
  }
}
