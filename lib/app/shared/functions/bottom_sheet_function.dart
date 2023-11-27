import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class BottomSheetFunction {
  static void showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
    required AppColors color,
    bool? bottomPadding,
    bool? topPadding,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: color.alwaysWhite,
      showDragHandle: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Spacings.spacing12,
          ),
          topRight: Radius.circular(
            Spacings.spacing12,
          ),
        ),
      ),
      builder: (context) {
        return BottomSheetContainerComponent(
          topPadding: topPadding,
          bottomPadding: bottomPadding,
          child: child,
        );
      },
    );
  }
}
