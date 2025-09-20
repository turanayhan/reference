import 'package:flutter/material.dart';
import 'package:view_ref/dialog/detail_dialog_extensions.dart';
import 'package:view_ref/list.dart';
import 'package:view_ref/model/payment.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  void _showPaymentDialog(BuildContext context, Payment payment) {
    // Extension factory metodunu kullan
    DetailDialogFactory.showPayment(context, payment, "Aysoft");
    
    // Alternatif kullanım:
    // showDialog(
    //   context: context,
    //   builder: (context) => DetailDialogFactory.payment(data: payment),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final payments = PaymentDummyData.getPayments();

    return Scaffold(
      appBar: AppBar(title: const Text("Ödemelerim")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];
          return GestureDetector(
            onTap: () => _showPaymentDialog(context, payment),
            child: PaymentItemCard(payment: payment),
          );
        },
      ),
    );
  }
}

// Payment için card widget
class PaymentItemCard extends StatelessWidget {
  final Payment payment;

  const PaymentItemCard({super.key, required this.payment});

  Color _getStatusColor() {
    switch (payment.status.toLowerCase()) {
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

  String _getStatusText() {
    switch (payment.status.toLowerCase()) {
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

  IconData _getCategoryIcon() {
    switch (payment.category.toLowerCase()) {
      case 'yol masrafı':
        return Icons.directions_car;
      case 'yemek masrafı':
        return Icons.restaurant;
      case 'kırtasiye':
        return Icons.edit;
      case 'konaklama':
        return Icons.hotel;
      case 'telefon':
        return Icons.phone;
      default:
        return Icons.payment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                _getCategoryIcon(),
                color: Colors.orange.shade600,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${payment.amount} ${payment.currency}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    payment.category,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    payment.receiptDate,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                  if (payment.isPaid == 1) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Ödendi",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: _getStatusColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _getStatusColor().withOpacity(0.3),
                ),
              ),
              child: Text(
                _getStatusText(),
                style: TextStyle(
                  color: _getStatusColor(),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}