import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';

class CustomNavigationBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingAllDefault.copyWith(top: 0),
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.03),
        vertical: context.dynamicHeight(0.01),
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.03)),
        border: Border.all(color: AppColors.borderLight, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: context.dynamicHeight(0.015),
            offset: Offset(0, context.dynamicHeight(0.005)),
          ),
        ],
      ),
      child: Row(
        children: List.generate(menuItems.length, (index) {
          bool isSelected = index == selectedIndex;

          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
              onTap: () => onItemTapped(index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: context.dynamicHeight(0.01),
                ),
              decoration: isSelected
    ? BoxDecoration(
        color: AppColors.selectedItemBackground,
        border: Border.all(
          color: AppColors.tabBarIndicatorColor,
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(
          context.dynamicHeight(0.02),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      )
    : null,


                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      menuItems[index]['icon'],
                      size: context.dynamicHeight(0.025),
                      color: isSelected
                          ? AppColors.iconSelected
                          : AppColors.iconUnselected,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      menuItems[index]['label'],
                      style: TextStyle(
                        fontSize: context.dynamicHeight(0.011).clamp(10.0, 14.0),
                        color: isSelected
                               ? AppColors.iconSelected
                          : AppColors.iconUnselected,
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
