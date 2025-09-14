import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';

class PopupMenuItemWidget extends ConsumerWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const PopupMenuItemWidget({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final borderColor = AppColors.borderLight;
    final backgroundColor = AppColors.inputBackground;
    final iconColor = item['color'] ?? AppColors.iconSelected;
    final textColor = iconColor;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue * 0.25),
      child: Material(
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.015)),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.dynamicHeight(0.015)),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            splashColor: iconColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(context.dynamicHeight(0.015)),
            child: Container(
              width: context.dynamicWidth(0.36),
              height: context.dynamicHeight(0.05),
              padding: EdgeInsets.symmetric(
                vertical: context.lowValue * 0.5,
                horizontal: context.defaultValue * 0.8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item['icon'],
                    color: iconColor,
                    size: context.dynamicHeight(0.025),
                  ),
                  SizedBox(width: context.dynamicWidth(0.03)),
                  Flexible(
                    child: Text(
                      item['label'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: context.dynamicHeight(0.014),
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}