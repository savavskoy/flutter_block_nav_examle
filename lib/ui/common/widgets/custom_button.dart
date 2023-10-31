import 'package:flutter/material.dart';
import 'package:flutter_block_nav_examle/ui/common/widgets/spacing_widget.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(title, style: AppTextStyles.buttonStyle),
            const SpacingWidget(width: 24),
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.arrow_forward_ios, color: AppColors.darkBlue),
              ),
            ),
            const SpacingWidget(
              width: 4,
            ),
          ],
        ),
      ),
    );
  }
}
