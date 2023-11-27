import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldComponent extends StatefulWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  final bool headerLess;
  final TextEditingController? textEditingController;
  final int lines;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Widget? suffix;
  final TextInputAction textInputAction;
  final Border? border;
  final Color? backgroundColor;

  final String? prefixText;
  final String? headerText;

  const TextFieldComponent({
    super.key,
    this.hint,
    this.onChanged,
    this.headerText = '',
    this.headerLess = true,
    this.textEditingController,
    this.lines = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.prefix,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.suffix,
    this.textInputAction = TextInputAction.done,
    this.border,
    this.backgroundColor,
    this.prefixText,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent>
    with AppThemeMixin {
  @override
  void initState() {
    _node = widget.focusNode ?? FocusNode();
    super.initState();
  }

  FocusNode? _node;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_node);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !widget.headerLess
              ? Text(
                  widget.headerText!,
                  style: TextStyle(
                    color: colors.always161455,
                    fontWeight: FontWeight.w400,
                    fontSize: TextSizes.size12,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: Spacings.spacing6),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              color: colors.alwaysF5F9FF,
              borderRadius: BorderRadius.circular(Spacings.spacing10),
            ),
            child: Row(
              children: [
                widget.prefix ?? const SizedBox(width: Spacings.spacing14),
                Expanded(
                  child: TextFormField(
                    focusNode: _node,
                    readOnly: widget.readOnly,
                    onChanged: widget.onChanged,
                    textInputAction: widget.textInputAction,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    controller: widget.textEditingController,
                    inputFormatters: widget.inputFormatters,
                    maxLines: widget.obscureText ? 1 : (widget.lines),
                    minLines: widget.obscureText ? 1 : (widget.lines),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colors.alwaysBlack,
                      fontSize: TextSizes.size14,
                    ),
                    decoration: InputDecoration(
                      prefixText: widget.prefixText,
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: colors.alwaysBlack,
                        fontSize: TextSizes.size14,
                      ),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: colors.always767676,
                        fontWeight: FontWeight.w400,
                        fontSize: TextSizes.size12,
                      ),
                      label: Text(
                        widget.hint ?? '',
                      ),
                      hintStyle: TextStyle(
                        color: colors.alwaysF5F9FF,
                        fontWeight: FontWeight.w400,
                        fontSize: TextSizes.size12,
                      ),
                    ),
                  ),
                ),
                widget.suffix ?? const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
