
import 'package:view_ref/model/leave_data.dart';

class Payment {
  final int id;
  final int employeeId;
  final int companyId;
  final String category;
  final double amount;
  final String currency;
  final String taxRate;
  final String receiptDate;
  final String description;
  final int skipApproval;
  final int notifyEmployee;
  final int isPaid;
  final String status;
  final String createdAt;
  final String updatedAt;
  final Employee employee;
  final List<dynamic> files;
  final ApprovalFlow approvalFlow;

  Payment({
    required this.id,
    required this.employeeId,
    required this.companyId,
    required this.category,
    required this.amount,
    required this.currency,
    required this.taxRate,
    required this.receiptDate,
    required this.description,
    required this.skipApproval,
    required this.notifyEmployee,
    required this.isPaid,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.employee,
    required this.files,
    required this.approvalFlow,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      employeeId: json['employee_id'],
      companyId: json['company_id'],
      category: json['category'],
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
      taxRate: json['tax_rate'],
      receiptDate: json['receipt_date'],
      description: json['description'] ?? '',
      skipApproval: json['skip_approval'],
      notifyEmployee: json['notify_employee'],
      isPaid: json['is_paid'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      employee: Employee.fromJson(json['employee']),
      files: json['files'],
      approvalFlow: ApprovalFlow.fromJson(json['approval_flow']),
    );
  }

  Payment copyWith({
    int? id,
    int? employeeId,
    int? companyId,
    String? category,
    double? amount,
    String? currency,
    String? taxRate,
    String? receiptDate,
    String? description,
    int? skipApproval,
    int? notifyEmployee,
    int? isPaid,
    String? status,
    String? createdAt,
    String? updatedAt,
    Employee? employee,
    List<dynamic>? files,
    ApprovalFlow? approvalFlow,
  }) {
    return Payment(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      companyId: companyId ?? this.companyId,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      taxRate: taxRate ?? this.taxRate,
      receiptDate: receiptDate ?? this.receiptDate,
      description: description ?? this.description,
      skipApproval: skipApproval ?? this.skipApproval,
      notifyEmployee: notifyEmployee ?? this.notifyEmployee,
      isPaid: isPaid ?? this.isPaid,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      employee: employee ?? this.employee,
      files: files ?? this.files,
      approvalFlow: approvalFlow ?? this.approvalFlow,
    );
  }
}