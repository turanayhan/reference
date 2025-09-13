import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/riverpod/theme_provider.dart';

class SearchBarField extends ConsumerWidget {
  final TextEditingController controller;
  final VoidCallback onClose;
  final ValueChanged<String>? onChanged;

  const SearchBarField({
    Key? key,
    required this.controller,
    required this.onClose,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    final backgroundColor =
        themeMode == ThemeMode.light ? Colors.grey.shade100 : Colors.grey.shade800;
    final borderColor =
        themeMode == ThemeMode.light ? Colors.grey.shade300 : Colors.grey.shade700;
    final iconColor = AppColors.navbarIconSelectedColor(themeMode);
    final textColor = iconColor;

    return Container(
      key: const ValueKey('search'),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: iconColor, size: 18),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Ara...',
                hintStyle: TextStyle(fontSize: 14, color: textColor.withOpacity(0.6)),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 6),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 14,
                color: textColor,
              ),
              onChanged: onChanged,
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: Icon(Icons.close, color: iconColor.withOpacity(0.7), size: 18),
          )
        ],
      ),
    );
  }
}