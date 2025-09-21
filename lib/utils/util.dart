import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';

void showFlushbar(
  BuildContext context,
  FlushbarNotificationModel notificationModel,
) {
  // Context'in mounted olup olmadığını kontrol et
  if (!context.mounted) return;

  toastification.show(
    context: context,
    type: notificationModel.type,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(
      notificationModel.title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: AppColors.whiteColor,
        fontSize: context.dynamicWidth(0.04),
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.justify,
    ),
    description: Text(
      notificationModel.subtitle,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: context.dynamicWidth(0.032),
        color: AppColors.whiteColor,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.justify,
    ),
    alignment: Alignment.topCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
    borderRadius: BorderRadius.circular(context.dynamicWidth(0.05)),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      ),
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}


class FlushbarNotificationModel {
  final String title;
  final String subtitle;
  final ToastificationType type;

  FlushbarNotificationModel({
    required this.title,
    required this.subtitle,
    required this.type,
  });
}

class FlushbarSuccessModel extends FlushbarNotificationModel {
  FlushbarSuccessModel({required super.title, required super.subtitle})
    : super(type: ToastificationType.success);
}

class FlushbarErrorModel extends FlushbarNotificationModel {
  FlushbarErrorModel({required super.title, required super.subtitle})
    : super(type: ToastificationType.error);
}

class FlushbarInfoModel extends FlushbarNotificationModel {
  FlushbarInfoModel({required super.title, required super.subtitle})
    : super(type: ToastificationType.warning);
}