import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/app_color.dart';

class ProfileMenuButton extends ConsumerWidget {
  final void Function(String) onSelected;

  const ProfileMenuButton({Key? key, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = AppColors.iconCustomColor;
    final textColor = AppColors.textPrimary;
    final popupBgColor = AppColors.backgroundWhite;
    final secondaryIconColor = AppColors.iconUnselected;

    return SizedBox(
      height: context.dynamicHeight(0.050),
      width: context.dynamicWidth(0.080),
      child: PopupMenuButton<String>(
        icon: Icon(
          Icons.person_outline,
          color: iconColor,
          size: context.dynamicHeight(0.04).clampFont(20, 26),
        ),
        onSelected: onSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: popupBgColor,
        offset: Offset(0, context.dynamicHeight(0.05)),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: secondaryIconColor,
                  size: context.dynamicHeight(0.025).clampFont(16, 20),
                ),
                const SizedBox(width: 6),
                Text(
                  'Profil',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Poppins',
                    fontSize: context.dynamicHeight(0.017).clampFont(12, 14),
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'change_password',
            child: Row(
              children: [
                Icon(
                  Icons.key_outlined,
                  color: secondaryIconColor,
                  size: context.dynamicHeight(0.025).clampFont(16, 20),
                ),
                const SizedBox(width: 6),
                Text(
                  'Şifre Değiştir',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Poppins',
                    fontSize: context.dynamicHeight(0.017).clampFont(12, 14),
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                Icon(
                  Icons.power_settings_new,
                  color: secondaryIconColor,
                  size: context.dynamicHeight(0.025).clampFont(16, 20),
                ),
                const SizedBox(width: 6),
                Text(
                  'Çıkış Yap',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Poppins',
                    fontSize: context.dynamicHeight(0.017).clampFont(12, 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}