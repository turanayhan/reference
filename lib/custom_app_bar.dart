import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/riverpod/theme_provider.dart';

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
  final bool showThemeButton;

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
    this.showThemeButton = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final bgColor = AppColors.backgroundWhite;
    final iconColor = AppColors.iconSelected;
    final textColor = iconColor;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: themeMode == ThemeMode.light
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: themeMode == ThemeMode.light
            ? Brightness.light
            : Brightness.dark,
      ),
    );

    final themeToggleButton = showThemeButton
        ? AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                RotationTransition(turns: animation, child: child),
            child: IconButton(
              key: ValueKey(themeMode),
              icon: Icon(
                themeMode == ThemeMode.light
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: iconColor,
              ),
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
          )
        : const SizedBox.shrink();

    final paddingHorizontal = context.dynamicWidth(0.04);
    final fontSize = context.dynamicWidth(0.035);

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              
              height: preferredSize.height,
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
            
                
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
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: context.dynamicWidth(0.045),
                          color: iconColor,
                        ),
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
                                color: textColor,
                              ),
                            ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (actions != null) ...[
                        ...actions!,
                        SizedBox(width: context.dynamicWidth(0.015)),
                      ],
                      if (showThemeButton) themeToggleButton,
                      if (profileAvatar != null)
                        GestureDetector(
                          onLongPress: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => const Center(
                                child: Text("Profil menüsü buraya gelecek"),
                              ),
                            );
                          },
                          child: profileAvatar!,
                        ),
                    ],
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
