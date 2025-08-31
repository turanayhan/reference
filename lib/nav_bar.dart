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
      margin: context.paddingAllDefault,
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.03),
        vertical: context.dynamicHeight(0.01),
      ),
      decoration: BoxDecoration(
        color: AppColors.sidebarBackground,
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.03)),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: context.dynamicHeight(0.015),
            offset: Offset(0, context.dynamicHeight(0.005)),
          ),
        ],
      ),
      child: Row(
        children: List.generate(menuItems.length, (index) {
          bool isSelected = index == selectedIndex;
          bool isMiddle = index == (menuItems.length / 2).floor();

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
                          color: isSelected
                              ? AppColors.selectedItemBackground
                              : AppColors.sidebarBackground,
                          border: Border.all(
                            color: AppColors.borderLight,
                            width: 1,
                          ),
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
                          color: isSelected
                              ? AppColors.iconSelected
                              : AppColors.iconUnselected,
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        vertical: context.dynamicHeight(0.01),
                      ),
                      decoration: isSelected
                          ? BoxDecoration(
                              color: AppColors.selectedItemBackground,
                              borderRadius: BorderRadius.circular(
                                context.dynamicHeight(0.02),
                              ),
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
                          SizedBox(height: context.dynamicHeight(0.00)),
                          Text(
                            menuItems[index]['label'],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: context
                                  .dynamicHeight(0.011)
                                  .clamp(10.0, 14.0),
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              color: isSelected
                                  ? AppColors.iconCustomColor
                                  : AppColors.textUnselected,
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


