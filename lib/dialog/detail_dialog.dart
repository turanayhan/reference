import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/dialog/info_row_item.dart';
import 'package:view_ref/extensions.dart';


class DetailDialog extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final List<InfoRowItem> infoRows;
  final String? status;
  final dynamic employee;
  final dynamic approvalFlow;
  final dynamic company;

  const DetailDialog({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.infoRows,
    this.status,
    this.employee,
    this.approvalFlow,
    this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.06),
        vertical: context.dynamicHeight(0.04),
      ),
      child: Container(
        padding: context.paddingAllHigh*0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.cardDefaultColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(context.dynamicWidth(0.025)),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: iconColor, size: 28),
                  ),
                  SizedBox(width: context.dynamicWidth(0.025)),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: context.responsiveFontSize(0.022, max: 18),
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (status != null) ...[
                          SizedBox(height: context.dynamicHeight(0.008)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.dynamicWidth(0.025),
                              vertical: context.dynamicHeight(0.004),
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(status).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _getStatusColor(status).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              _getStatusText(status!),
                              style: TextStyle(
                                color: _getStatusColor(status),
                                fontSize: context.responsiveFontSize(0.011, max: 11),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: context.dynamicWidth(0.01)),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: EdgeInsets.all(context.dynamicWidth(0.015)),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.cursorColor,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.dynamicHeight(0.025)),

              // Info Rows
              ...infoRows.map(
                (item) {
                  String displayValue = item.value;

                  // Tarih alanı ise sadece tarih kısmını göster
                  if (item.title.toLowerCase().contains('tarih')) {
                    displayValue = _formatDateOnly(item.value);
                  }

                  return _buildInfoRow(
                    context,
                    item.title,
                    displayValue,
                    icon: item.icon,
                    iconColor: item.iconColor,
                    valueColor: item.title.contains("Durum")
                        ? _getStatusColor(status)
                        : null,
                  );
                },
              ),

              // Onay Süreci
             // Onay Süreci
if (employee != null && approvalFlow != null) ...[
  SizedBox(height: context.dynamicHeight(0.03)),
  Text(
    "Onay Süreci",
    style: TextStyle(
      fontSize: context.responsiveFontSize(0.02, max: 18),
      fontWeight: FontWeight.w600,
    ),
  ),
  SizedBox(height: context.dynamicHeight(0.02)),
  Container(
    padding: EdgeInsets.all(context.dynamicWidth(0.04)),
    decoration: BoxDecoration(
      color: AppColors.cardDefaultColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.grey,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        // Talep Eden
        Expanded(
          child: _buildStep(
            context: context,
            icon: Icons.person,
            title: "Talep Eden",
            subtitle: employee?.name ?? "-",
            isCompleted: true,
          ),
        ),

        // Ok 1
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.grey,
          size: context.dynamicWidth(0.035),
        ),

        // Şirket
        Expanded(
          child: _buildStep(
            context: context,
            icon: Icons.business,
            title: "Şirket",
            subtitle: company?.name ?? "-",
            isCompleted: true,
          ),
        ),

        // Ok 2
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.grey,
          size: context.dynamicWidth(0.035),
        ),

        // Durum (Onaylayan / Reddeden / Beklemede)
        Expanded(
          child: Builder(
            builder: (context) {
              final steps = (approvalFlow?.steps as List?) ?? [];
              final step = steps.isNotEmpty ? steps[0] : null;

              String stepTitle;
              IconData stepIcon;
              String subtitle = step?.employee?.name ?? "Bilinmiyor";
              bool isCompleted = false;

              switch (status?.toLowerCase()) {
                case 'approved':
                  stepTitle = "Onaylayan";
                  stepIcon = Icons.verified_user;
                  isCompleted = true;
                  break;
                case 'rejected':
                  stepTitle = "Reddeden";
                  stepIcon = Icons.cancel;
                  isCompleted = true;
                  break;
                case 'pending':
                default:
                  stepTitle = "Durum";
                  stepIcon = Icons.hourglass_empty;
                  subtitle = "Beklemede";
                  isCompleted = false;
                  break;
              }

              return _buildStep(
                context: context,
                icon: stepIcon,
                title: stepTitle,
                subtitle: subtitle,
                isCompleted: isCompleted,
              );
            },
          ),
        ),
      ],
    ),
  ),
],

            ],
          ),
        ),
      ),
    );
  }

  String _formatDateOnly(String value) {
    if (value.contains(' ')) {
      return value.split(' ').first;
    }
    return value;
  }

  Widget _buildInfoRow(
    BuildContext context,
    String title,
    String value, {
    IconData? icon,
    Color? iconColor,
    Color? valueColor,
  }) {
    final bool isDateField = title.toLowerCase().contains('tarih');
    final bool isStatusField = title.contains("Durum");

    IconData resolvedIcon = icon ??
        (isDateField
            ? Icons.calendar_today
            : isStatusField
                ? Icons.circle
                : Icons.info_outline);

    Color resolvedIconColor = iconColor ??
        (isDateField
            ? AppColors.primaryBlue
            : isStatusField
                ? _getStatusColor(status)
                : Colors.grey[400]!);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue * 0.6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.dynamicWidth(0.28),
            child: Row(
              children: [
                Icon(
                  resolvedIcon,
                  size: 14,
                  color: resolvedIconColor,
                ),
                SizedBox(width: context.dynamicWidth(0.02)),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: context.responsiveFontSize(0.015, max: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: context.dynamicWidth(0.04)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: context.responsiveFontSize(0.015, max: 14),
                color: valueColor ?? AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    final color = isCompleted ? AppColors.leaveApproved : AppColors.leavePending;

    return Column(
      children: [
        Container(
          width: context.dynamicWidth(0.09),
          height: context.dynamicWidth(0.09),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
          child: Icon(icon, color: color, size: context.dynamicWidth(0.04)),
        ),
        SizedBox(height: context.dynamicHeight(0.008)),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.responsiveFontSize(0.012, max: 12),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.dynamicHeight(0.003)),
        SizedBox(
          width: context.dynamicWidth(0.18),
          child: Text(
            subtitle,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: context.responsiveFontSize(0.01, max: 10),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return 'Onaylandı';
      case 'rejected':
        return 'Reddedildi';
      case 'pending':
        return 'Beklemede';
      default:
        return status;
    }
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return AppColors.leaveApproved;
      case 'rejected':
        return AppColors.leaveRejected;
      case 'pending':
        return AppColors.leavePending;
      default:
        return Colors.grey;
    }
  }
}
