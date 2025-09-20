import 'package:flutter/material.dart';
import 'package:view_ref/dialog/detail_dialog.dart';
import 'package:view_ref/model/leave_data.dart';
import 'package:view_ref/model/payment.dart';

extension DetailDialogFactory on DetailDialog {
  static DetailDialog leave({
    required LeaveData data,
    VoidCallback? onTap,
  }) {
    return DetailDialog(
      title: "İzin Detayı",
      icon: Icons.event_note,
      iconColor: Colors.blue,
      infoRows: {
        "Tarih": "${data.startDate} - ${data.endDate}",
        "Gün Sayısı": "${data.days ?? '-'} gün",
        "Kural": data.leaveRule?.name ?? "Belirtilmemiş",
        "Açıklama": data.description ?? "Açıklama yok",
        "Durum": data.status != null ? _getStatusTextStatic(data.status!) : "Bilinmiyor",
      },
      status: data.status,
      employee: data.employee,
      approvalFlow: data.approvalFlow,
    );
  }


  static DetailDialog payment({
    required Payment data,
    // ignore: avoid_types_as_parameter_names
    required String aysoft,
    VoidCallback? onTap,
  }) {
    return DetailDialog(
      title: "Ödeme Detayı",
      icon: Icons.payment,
      iconColor: Colors.orange,
      infoRows: {
        "Kategori": data.category,
        "Tutar": "${data.amount} ${data.currency}",
        "Vergi Oranı": "${data.taxRate}%",
        "Fiş Tarihi": data.receiptDate,
        "Açıklama": data.description,
        "Ödendi": data.isPaid == 1 ? "Evet" : "Hayır",
        "Durum": _getStatusTextStatic(data.status),
      },
      status: data.status,
      employee: data.employee,
      approvalFlow: data.approvalFlow,
    );
  }

 

  // Helper için static method
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

  // Show dialog helper methods
  static void showLeave(BuildContext context, LeaveData data) {
    showDialog(context: context, builder: (_) => leave(data: data));
  }

 
  static void showPayment(BuildContext context, Payment data,String aysoft) {
    showDialog(context: context, builder: (_) => payment(data: data, aysoft: aysoft));
  }

 
}

