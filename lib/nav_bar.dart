import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/riverpod/theme_provider.dart';

class CustomNavigationBar extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<Map<String, dynamic>> menuItems;

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    final sidebarBg = AppColors.sidebarBackground(themeMode);
    final borderColor = AppColors.borderLight(themeMode);
    final iconSelected = AppColors.iconSelected(themeMode);
    final iconUnselected = AppColors.iconUnselected(themeMode);
    final textUnselected = AppColors.textUnselected(themeMode);
    final selectedBg = AppColors.selectedItemBackground(themeMode);
    final shadowColor = Colors.black12;

    return Container(
      margin: context.paddingAllDefault,
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.03),
        vertical: context.dynamicHeight(0.01),
      ),
      decoration: BoxDecoration(
        color: sidebarBg,
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.03)),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: context.dynamicHeight(0.015),
            offset: Offset(0, context.dynamicHeight(0.005)),
          ),
        ],
      ),
      child: Row(
        children: List.generate(menuItems.length, (index) {
          final isSelected = index == selectedIndex;
          final isMiddle = index == (menuItems.length / 2).floor();

          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
              onTap: () => onItemTapped(index),
              child: isMiddle
                  ? Transform.translate(
                      offset: Offset(0, -context.dynamicHeight(0.02)),
                      child: Container(
                        padding: EdgeInsets.all(context.dynamicHeight(0.015)),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? selectedBg : sidebarBg,
                          border: Border.all(color: borderColor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: context.dynamicHeight(0.01),
                              offset: Offset(0, context.dynamicHeight(0.006)),
                            ),
                          ],
                        ),
                        child: Icon(
                          menuItems[index]['icon'],
                          size: context.dynamicHeight(0.03),
                          color: isSelected ? iconSelected : iconUnselected,
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        vertical: context.dynamicHeight(0.01),
                      ),
                      decoration: isSelected
                          ? BoxDecoration(
                              color: selectedBg,
                              borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
                            )
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            menuItems[index]['icon'],
                            size: context.dynamicHeight(0.025),
                            color: isSelected ? iconSelected : iconUnselected,
                          ),
                          SizedBox(height: context.dynamicHeight(0.002)),
                          Text(
                            menuItems[index]['label'],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: context.dynamicHeight(0.011).clamp(10.0, 14.0),
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                              color: isSelected ? iconSelected : textUnselected,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          );
        }),
      ),
    );
  }
}