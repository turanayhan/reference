import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? profileAvatar;
  final Widget? leading;
  final bool floating;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.profileAvatar,
    this.leading,
    this.floating = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? AppColors.backgroundWhite;
    final Color textColor = Theme.of(context).appBarTheme.titleTextStyle?.color ?? AppColors.textBlack;
    final Color iconColor = Theme.of(context).iconTheme.color ?? AppColors.iconSelected;

    final paddingHorizontal = context.dynamicWidth(0.05);
    final fontSize = context.dynamicHeight(0.028).clamp(18.0, 22.0).toDouble();

    // Status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          height: preferredSize.height,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(floating ? 25 : 0),
            boxShadow: [
              if (floating)
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
            ],
            border: const Border(
              bottom: BorderSide(color: AppColors.borderLight, width: 0.7),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Leading
              if (leading != null)
                Padding(
                  padding: EdgeInsets.only(right: context.dynamicWidth(0.03)),
                  child: leading,
                )
              else
                Icon(Icons.group, color: iconColor, size: fontSize * 1.3),

              // Back button
              if (showBackButton)
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: iconColor, size: fontSize * 0.8),
                  onPressed: () {
                    if (Navigator.canPop(context)) Navigator.pop(context);
                  },
                )
              else
                SizedBox(width: fontSize * 1.4),

              // Title
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    letterSpacing: 0.6,
                    shadows: [
                      Shadow(
                        color: iconColor.withOpacity(0.05),
                        offset: const Offset(0, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),

              // Actions
              if (actions != null) ...actions!,

              // Profile avatar
              if (profileAvatar != null) ...[
                SizedBox(width: context.dynamicWidth(0.03)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    height: fontSize * 1.6,
                    width: fontSize * 1.6,
                    child: profileAvatar,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}