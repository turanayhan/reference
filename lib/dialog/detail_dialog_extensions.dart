import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/dialog/detail_dialog.dart';
import 'package:view_ref/dialog/info_row_item.dart';


  String _calculateDurationOrDays(String? startDateStr, String? endDateStr, int? days) {
  try {
    if (startDateStr == null || endDateStr == null) return "-";

    final startDate = DateTime.parse(startDateStr);
    final endDate = DateTime.parse(endDateStr);
    final duration = endDate.difference(startDate);

    if (duration.inDays < 1) {
      final hours = duration.inHours;
      final minutes = duration.inMinutes % 60;
      return "$hours saat $minutes dakika";
    } else {
      return "${days ?? '-'} gün";
    }
  } catch (e) {
    return "-";
  }
}



extension DetailDialogFactory on DetailDialog {
  static DetailDialog leave({
    required dynamic data,
    VoidCallback? onTap,
  }) {
    return DetailDialog(
      title: "İzin Detayı",
      icon: Icons.event_note,
      iconColor: Colors.blue,
      company: data.company,
      infoRows: [
        InfoRowItem(
          title: "Başlangıç",
          value: "${data.startDate}",
          icon: Icons.calendar_today,
          iconColor: Colors.blue,
        ),

         InfoRowItem(
          title: "Bitiş",
          value: "${data.endDate}",
          icon: Icons.calendar_today,
          iconColor: Colors.blue,
        ),
InfoRowItem(
  title: "Süre",
  value: _calculateDurationOrDays(data.startDate, data.endDate, data.days),
  icon: Icons.timer,
),


        InfoRowItem(
          title: "Kural",
          value: data.leaveRule?.name ?? "Belirtilmemiş",
          icon: Icons.rule,
        ),
        InfoRowItem(
          title: "Açıklama",
          value: data.description ?? "Açıklama yok",
          icon: Icons.description,
        ),
        InfoRowItem(
          title: "Durum",
          value: data.status != null
              ? _getStatusTextStatic(data.status!)
              : "Bilinmiyor",
          icon: Icons.info,
          iconColor: _getStatusColorStatic(data.status),
        ),
      ],
      status: data.status,
      employee: data.employee,
      approvalFlow: data.approvalFlow,
    );
  }

  static DetailDialog payment({
    required dynamic data,
    required String aysoft,
    VoidCallback? onTap,
  }) {
    return DetailDialog(
      title: "Ödeme Detayı",
      icon: Icons.payment,
      iconColor: Colors.orange,
      infoRows: [
        InfoRowItem(
          title: "Kategori",
          value: data.category,
          icon: Icons.category,
        ),
        InfoRowItem(
          title: "Tutar",
          value: "${data.amount} ${data.currency}",
          icon: Icons.attach_money,
        ),
        InfoRowItem(
          title: "Vergi Oranı",
          value: "${data.taxRate}%",
          icon: Icons.percent,
        ),
        InfoRowItem(
          title: "Fiş Tarihi",
          value: data.receiptDate,
          icon: Icons.calendar_today,
          iconColor: Colors.blue,
        ),
        InfoRowItem(
          title: "Açıklama",
          value: data.description,
          icon: Icons.description,
        ),
        InfoRowItem(
          title: "Ödendi",
          value: data.isPaid == 1 ? "Evet" : "Hayır",
          icon: data.isPaid == 1 ? Icons.check_circle : Icons.cancel,
          iconColor: data.isPaid == 1 ? Colors.green : Colors.red,
        ),
        InfoRowItem(
          title: "Durum",
          value: _getStatusTextStatic(data.status),
          icon: Icons.info,
          iconColor: _getStatusColorStatic(data.status),
        ),
      ],
      status: data.status,
      employee: data.employee,
      approvalFlow: data.approvalFlow,
    );
  }

  // Static helper for status text
  static String _getStatusTextStatic(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return 'Onaylandı';
      case 'pending':
        return 'Beklemede';
      case 'rejected':
        return 'Reddedildi';
      default:
        return 'Bilinmiyor';
    }
  }

  // Static helper for status color
  static Color _getStatusColorStatic(String? status) {
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

  
  static void showLeave(BuildContext context, dynamic data) {
    showDialog(context: context, builder: (_) => leave(data: data));
  }

  static void showPayment(BuildContext context, dynamic data, String aysoft) {
    showDialog(context: context, builder: (_) => payment(data: data, aysoft: aysoft));
  }
}