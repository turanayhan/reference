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
              style: TextStyle(
                color: AppColors.textUnselected,
                fontSize: context.dynamicHeight(0.0135),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
        DropdownButtonFormField<T>(
          value: selectedValue,
          isExpanded: true,
          dropdownColor: AppColors.inputBackground, // 🔹 Menü arka planı
          menuMaxHeight: 250, // 🔹 Maksimum yükseklik
          items: items.map((item) {
            final isSelected = item == selectedValue;
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: enabled == false
              ? null
              : (value) => ref.read(provider.notifier).state = value,
          decoration: InputDecoration(
            hintText: hintText ?? '',
            hintStyle: TextStyle(color: AppColors.hintColor),
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
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
          ),
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: context.defaultValue.clampFont(14, 16),
          ),
        ),
        if (bottomPadding != null) SizedBox(height: bottomPadding!),
      ],
    );
  }
}