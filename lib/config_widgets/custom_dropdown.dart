import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/app_color.dart';

class CustomDropdownField<T> extends ConsumerWidget {
  final String? title;
  final String? hintText;
  final List<T> items;
  final StateProvider<T?> provider;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final double? bottomPadding;
  final String Function(T)? itemAsString;

  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? selectedItemStyle;

  const CustomDropdownField({
    Key? key,
    this.title,
    this.hintText,
    required this.items,
    required this.provider,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.borderRadius,
    this.bottomPadding,
    this.itemAsString,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.selectedItemStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radius = borderRadius ?? 8.0;
    final padding = contentPadding ??
        EdgeInsets.symmetric(horizontal: context.defaultValue, vertical: 10);

    final selectedValue = ref.watch(provider);

    return Column(
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
              style: 
                  TextStyle(
                    color: AppColors.cursorColor,
                    fontSize: context.dynamicHeight(0.0135),
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
       DropdownButtonFormField<T>(
  value: selectedValue,
  isExpanded: true,
  hint: Text( // BU SATIRI EKLEDİK
    hintText ?? '',
    style: hintStyle ?? TextStyle(color: AppColors.cursorColor),
  ),
  dropdownColor: AppColors.inputBackground,
  menuMaxHeight: 250,
  items: items.map((item) {
    final isSelected = item == selectedValue;
    final text = itemAsString != null
        ? itemAsString!(item)
        : item.toString();
    return DropdownMenuItem<T>(
      value: item,
      child: Text(
        text,
        style: selectedItemStyle ??
            TextStyle(
              color: AppColors.cursorColor,
              fontWeight: isSelected ? FontWeight.w400 : FontWeight.w400,
            ),
      ),
    );
  }).toList(),
  onChanged: enabled == false
      ? null
      : (value) => ref.read(provider.notifier).state = value,
  decoration: InputDecoration(
    filled: true,
    fillColor: AppColors.lightGrayColor,
    contentPadding: padding,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: AppColors.inputBorderGrey,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: AppColors.inputBorderGrey,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: AppColors.cursorColor,
        width: 1,
      ),
    ),
  ),
  style: style,
),

        if (bottomPadding != null) SizedBox(height: bottomPadding!),
      ],
    );
  }
}

