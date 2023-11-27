import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.onLeadingTapped,
    this.hasLeading = false,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingTapped;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return AppBar(
          backgroundColor: color.alwaysWhite,
          centerTitle: false,
          elevation: 0,
          leading: hasLeading ? leading : const CustomBackButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: Spacings.spacing20,
              ),
              child: Row(
                children: [
                  ...?actions,
                ],
              ),
            ),
          ],
          title: title != null
              ? BaseText(
                  title ?? '',
                  fontWeight: FontWeight.bold,
                  fontSize: TextSizes.size16,
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Spacings.spacing40);
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return GestureDetector(
          onTap: () => pop(context),
          child: Padding(
            padding: const EdgeInsets.all(Spacings.spacing8),
            child: Icon(
              Icons.arrow_back,
              color: color.alwaysBlack,
            ),
          ),
        );
      },
    );
  }
}
