// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/riverpod/theme_provider.dart';

class CustomTextFormField extends ConsumerWidget {
  final String? title;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final TextEditingController? _controller;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final TextDecoration? decorationText;
  final TextAlign? textAlign;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffix;
  final FocusNode? focusNode;
  final String? helperText;
  final Function()? onEditingComplete;
  final TextStyle? errorStyle;
  final double? bottomPadding;
  final Color? titleColor;
  final bool? enableInteractiveSelection;

  const CustomTextFormField({
    super.key,
    this.title,
    this.hintText,
    this.labelText,
    this.initialValue,
    TextEditingController? controller,
    this.keyboardType,
    this.readOnly,
    this.obscureText,
    this.enabled,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.inputFormatters,
    this.decoration,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textCapitalization,
    this.style,
    this.decorationText,
    this.textAlign,
    this.onTap,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.focusNode,
    this.helperText,
    this.onEditingComplete,
    this.bottomPadding,
    this.errorStyle =
        const TextStyle(fontSize: 10, color: Colors.deepOrangeAccent),
    this.titleColor,
    this.enableInteractiveSelection,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider); // 🔹 Riverpod Theme Provider

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: EdgeInsets.only(
              left: context.dynamicWidth(0.01),
              bottom: context.dynamicHeight(0.004),
            ),
            child: Text(
              title!,
              style: TextStyle(
                color: AppColors.textUnselected(themeMode),
                fontSize: context.dynamicHeight(0.0135),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
        TextFormField(
          controller: _controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          cursorColor: AppColors.blackColor(themeMode),
          cursorRadius: const Radius.circular(8),
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          enabled: enabled ?? true,
          enableInteractiveSelection:
              enableInteractiveSelection ?? (readOnly == true ? false : true),
          maxLength: maxLength,
          maxLines: (obscureText ?? false) ? 1 : (maxLines ?? 1),
          minLines: minLines ?? 1,
          textAlign: textAlign ?? TextAlign.start,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          initialValue: initialValue,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction ?? TextInputAction.done,
          onFieldSubmitted: onFieldSubmitted,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
         
          onTapOutside: (PointerDownEvent event) {
            FocusScope.of(context).unfocus();
            onEditingComplete?.call();
          },
          decoration: decoration ??
              InputDecoration(
                errorStyle: errorStyle,
                errorMaxLines: 2,
                suffix: suffix,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.03),
                  vertical: context.dynamicHeight(0.01),
                ),
                hintText: hintText,
              
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.inputBorderGrey(themeMode),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.inputBorderGrey(themeMode),
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                 
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.errorRed(themeMode),
                    width: 1.0,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.errorRed(themeMode),
                    width: 1.2,
                  ),
                ),
                fillColor: AppColors.lightGrayColor(themeMode),
                filled: true,
                labelText: labelText,
               
                helperText: helperText,
              ),
          onTap: onTap,
        ),
        if (bottomPadding != null)
          SizedBox(height: context.dynamicHeight(bottomPadding!)),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}