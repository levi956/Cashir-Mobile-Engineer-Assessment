import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class BottomSheetContainerComponent extends StatelessWidget {
  const BottomSheetContainerComponent({
    super.key,
    this.bottomPadding,
    required this.child,
    this.topPadding = true,
    this.useIntrinsicHeight = true,
    this.customHeight,
  });

  final Widget child;
  final bool? bottomPadding;
  final bool? topPadding;
  final bool? useIntrinsicHeight;
  final double? customHeight;

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return useIntrinsicHeight ?? true
            ? IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: bottomPadding ?? true ? Spacings.spacing45 : 0,
                    top: topPadding ?? true ? Spacings.spacing12 : 0,
                    left: Spacings.spacing24,
                    right: Spacings.spacing24,
                  ),
                  color: color.alwaysWhite,
                  child: Column(
                    children: [
                      Expanded(
                        child: child,
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: customHeight ?? Spacings.spacing243,
                padding: EdgeInsets.only(
                  bottom: bottomPadding ?? true ? Spacings.spacing45 : 0,
                  top: topPadding ?? true ? Spacings.spacing10 : 0,
                  left: Spacings.spacing24,
                  right: Spacings.spacing24,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: child,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
