// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:view_ref/riverpod/theme_provider.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/app_color.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? profileAvatar;
  final Widget? leading;
  final bool showLogo;
  final IconData leadingIcon;
  final Widget? customTitle;
  final bool showThemeButton; // 🔹 yeni parametre

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.profileAvatar,
    this.leading,
    this.showLogo = true,
    this.leadingIcon = Icons.group_rounded,
    this.customTitle,
    this.showThemeButton = false, // default false
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    final bgColor = backgroundColor ?? AppColors.backgroundWhite(themeMode);
    final iconColor = AppColors.iconSelected(themeMode);
    final textColor = iconColor;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgColor,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      statusBarBrightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
    ));

    // Tema toggle butonu sadece showThemeButton true ise göster
    final themeToggleButton = showThemeButton
        ? IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              color: iconColor,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          )
        : const SizedBox.shrink();

    final paddingHorizontal = context.dynamicWidth(0.04);
    final fontSize = context.dynamicWidth(0.035);

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: preferredSize.height,
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border(
              bottom: BorderSide(color: iconColor.withOpacity(0.2), width: 1),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leading != null)
                Padding(
                  padding: EdgeInsets.only(right: context.dynamicWidth(0.02)),
                  child: leading!,
                )
              else if (showLogo)
                Padding(
                  padding: EdgeInsets.only(right: context.dynamicWidth(0.02)),
                  child: Icon(
                    leadingIcon,
                    color: iconColor,
                    size: context.dynamicWidth(0.06),
                  ),
                )
              else if (showBackButton)
                Transform.translate(
                  offset: Offset(context.dynamicWidth(-0.02), 0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back_ios,
                        size: context.dynamicWidth(0.045), color: iconColor),
                    onPressed: () {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
                  ),
                )
              else
                SizedBox(width: context.dynamicWidth(0.05)),

              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: customTitle ??
                        Text(
                          title,
                          key: const ValueKey('title'),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              color: textColor),
                        ),
                  ),
                ),
              ),

              if (actions != null) ...[Row(children: actions!)],
              themeToggleButton,
              if (profileAvatar != null) ...[
                SizedBox(width: context.dynamicWidth(0.02)),
                profileAvatar!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}