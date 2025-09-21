import 'package:flutter/material.dart';
import 'package:view_ref/extensions.dart';


class DetailDialog extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Map<String, String> infoRows;
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
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.06),
        vertical: context.dynamicHeight(0.04),
      ),
      child: Container(
        padding: context.paddingAllHigh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Icon(icon, color: iconColor, size: 28),
                  SizedBox(width: context.dynamicWidth(0.03)),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(0.025,  max: 20),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              SizedBox(height: context.dynamicHeight(0.025)),

              // Info Rows
              ...infoRows.entries.map(
                (entry) {
                  String displayValue = entry.value;

                  // Tarih alanı ise sadece tarih kısmını göster
                  if (entry.key.toLowerCase().contains('tarih')) {
                    displayValue = _formatDateOnly(entry.value);
                  }

                  return _buildInfoRow(
                    context,
                    entry.key,
                    displayValue,
                    valueColor: entry.key.contains("Durum")
                        ? _getStatusColor(status)
                        : null,
                  );
                },
              ),

              if (employee != null && approvalFlow != null) ...[
                SizedBox(height: context.dynamicHeight(0.03)),
                Text(
                  "Onay Süreci",
                  style: TextStyle(
                    fontSize: context.responsiveFontSize(0.02,  max: 18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Talep Eden
                      _buildStep(
                        context: context,
                        icon: Icons.person,
                        title: "Talep Eden",
                        subtitle: employee?.name ?? "-",
                        isCompleted: true,
                      ),
                      Icon(Icons.arrow_forward,
                          color: Colors.grey, size: context.dynamicWidth(0.04)),

                      // Şirket
                      _buildStep(
                        context: context,
                        icon: Icons.business,
                        title: "Şirket",
                        subtitle: company?.name ?? "-",
                        isCompleted: true,
                      ),
                      Icon(Icons.arrow_forward,
                          color: Colors.grey, size: context.dynamicWidth(0.04)),

                      // Sadece 1 onaylayan göster
                      if ((approvalFlow?.steps as List).isNotEmpty) ...[
                        Builder(
                          builder: (context) {
                            final step = approvalFlow.steps[0];
                            final approver = step.employee?.name ?? "Bilinmiyor";
                            final isApproved =
                                (step.status?.toLowerCase() == "approved");
                            return _buildStep(
                              context: context,
                              icon: Icons.verified_user,
                              title: "Onaylayan 1",
                              subtitle: approver,
                              isCompleted: isApproved,
                            );
                          },
                        ),
                      ],
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

  Widget _buildInfoRow(BuildContext context, String title, String value,
      {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue * 0.6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.dynamicWidth(0.28),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: context.responsiveFontSize(0.015,  max: 14),
              ),
            ),
          ),
          SizedBox(width: context.dynamicWidth(0.04)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: context.responsiveFontSize(0.015,  max: 14),
                color: valueColor ?? Colors.black87,
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
    final color = isCompleted ? Colors.green : Colors.grey[400]!;

    return Padding(
      padding: EdgeInsets.only(right: context.dynamicWidth(0.02)),
      child: Column(
        children: [
          Container(
            width: context.dynamicWidth(0.1),
            height: context.dynamicWidth(0.1),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: context.dynamicWidth(0.05)),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: context.responsiveFontSize(0.013,  max: 14),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.dynamicHeight(0.005)),
          SizedBox(
            width: context.dynamicWidth(0.15),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: context.responsiveFontSize(0.011,  max: 12),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
