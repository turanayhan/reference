import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/mixin/leave_status_mixin.dart';
import 'package:view_ref/model/leave_data.dart';


class PermissionsItemCard extends StatelessWidget with LeaveStatusMixin {
  final LeaveData leave;

  const PermissionsItemCard({super.key, required this.leave});

  double responsiveFontSize(
    BuildContext context,
    double scale, {
    double max = double.infinity,
  }) {
    final size = context.dynamicHeight(scale);
    return size > max ? max : size;
  }

  @override
  Widget build(BuildContext context) {
    final statusIcon = getStatusIcon(leave.status);
    final statusColor = getStatusColor(leave.status);
    final statusBgColor = getStatusBackgroundColor(leave.status);
    final statusTextColor = getStatusTextColor(leave.status);
    final statusIconColor = getStatusIconColor(leave.status);
    final statusText = getStatusText(leave.status);

    return Container(
      margin: EdgeInsets.only(bottom: context.lowValue),
      padding: EdgeInsets.all(context.defaultValue),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(context.dynamicWidth(0.025)),
        border: Border.all(color: AppColors.borderLight, width: 1),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: context.dynamicWidth(0.12),
                height: context.dynamicWidth(0.12),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Arka plan kaldırıldı
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        statusBgColor, // Border rengi olarak statusBgColor kullanıldı
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.access_time,
                  color: statusColor,
                  size: context.dynamicHeight(0.035),
                ),
              ),
              Positioned(
                right: -context.lowValue * 0.4,
                top: -context.lowValue * 0.4,
                child: CircleAvatar(
                  radius: context.dynamicHeight(0.014),
                  backgroundColor: AppColors.cardDefaultColor,
                  child: Icon(
                    statusIcon,
                    size: context.dynamicHeight(0.018),
                    color: statusIconColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: context.lowValue * 1.2),

          /// TEXT ALANI
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KAÇ GÜN OLDUĞU
                Text(
                  "${leave.days} Gün İzin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: responsiveFontSize(context, 0.022, max: 12),
                    color: AppColors.textPrimary, // 🟢 Tema destekli
                  ),
                ),
                SizedBox(height: context.lowValue * 0.4),

                // TARİHLER
                Text(
                  "${leave.startDate} - ${leave.endDate}",
                  style: TextStyle(
                    color: AppColors.textUnselected, // 🟢 Tema destekli
                    fontSize: responsiveFontSize(context, 0.016, max: 12),
                  ),
                ),

                SizedBox(height: context.lowValue * 0.4),

                // ÜCRETSİZ İZİN YAZISI EN ALTA
                Text(
                  leave.leaveRule?.name ?? '',
                  style: TextStyle(
                    fontSize: responsiveFontSize(context, 0.016, max: 11),
                    color: AppColors.grey, // 🟢 Tema destekli
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          /// DURUM ETİKETİ (border ile, arkaplan şeffaf)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.lowValue,
              vertical: context.lowValue * 0.5,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent, // Arkaplan kaldırıldı
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    statusBgColor, // Border rengi olarak statusBgColor kullanıldı
                width: 1.5,
              ),
            ),
            child: Text(
              statusText,
              style: TextStyle(
                color: statusTextColor,
                fontWeight: FontWeight.w500,
                fontSize: responsiveFontSize(context, 0.012, max: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}