import 'package:flutter/material.dart';
import 'package:flutter_block_nav_examle/ui/common/widgets/spacing_widget.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTapAction;

  const CustomListtile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.lightBeige,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleStyle,
                    ),
                    const SpacingWidget(
                      height: 8,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.subtitleStyle,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.darkBlue,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.arrow_forward_ios, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
