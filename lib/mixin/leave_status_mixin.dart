import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';

mixin LeaveStatusMixin {
  String getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return 'Onaylandı';
      case 'rejected':
        return 'Reddedildi';
      case 'pending':
        return 'Beklemede';
      default:
        return 'Bilinmiyor';
    }
  }

  IconData getStatusIcon(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return Icons.check_circle;
      case 'rejected':
        return Icons.cancel;
      case 'pending':
        return Icons.hourglass_top;
      default:
        return Icons.help_outline;
    }
  }

  Color getStatusIconColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return AppColors.leaveApproved;
      case 'rejected':
        return AppColors.leaveRejected;
      case 'pending':
        return AppColors.leavePending;
      default:
        return AppColors.leaveUnknown;
    }
  }

  Color getStatusColor(String? status) => getStatusIconColor(status);

  Color getStatusBackgroundColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return AppColors.leaveApprovedBg;
      case 'rejected':
        return AppColors.leaveRejectedBg;
      case 'pending':
        return AppColors.leavePendingBg;
      default:
        return AppColors.leaveUnknownBg;
    }
  }

  Color getStatusTextColor(String? status) => getStatusIconColor(status);
}