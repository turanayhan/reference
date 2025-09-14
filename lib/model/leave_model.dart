


class LeavePolicy {
  int? id;
  int? companyId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? isDefault;
  final List<LeaveRule>? leaveRules;

  LeavePolicy({
    this.id,
    this.companyId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isDefault,
    this.leaveRules,
  });

  factory LeavePolicy.fromJson(Map<String, dynamic> json) {
    return LeavePolicy(
      id: json['id'],
      companyId: json['company_id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      isDefault: json['is_default'],
      leaveRules: (json['leave_rules'] as List<dynamic>?)
          ?.map((e) => LeaveRule.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'is_default': isDefault,
    };
  }
}





class LeaveRule {
  int? id;
  int? leavePolicyId;
  int? companyId;
  String? name;
  String? description;
  String? internalCode;
  String? isPaid;
  int? progressPaymentDateDelay;
  String? limit;
  int? day;
  int? ageException;
  int? ageExceptionDayLimit;
  String? negativeBalance;
  int? negativeBalanceDayLimit;
  String? vestingFrequency;
  String? period;
  String? startDate;
  String? handover;
  int? handoverPaymentLimit;
  int? handoverLimit;
  String? handoverResetTime;
  List<dynamic>? seniority;
  String? demandMinimum;
  String? demandMaximum;
  String? calculationType;
  int? descriptionObligation;
  int? caregiverObligation;
  int? waitingTime;
  int? waitingMonth;
  int? overrideWorkSchedule;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LeaveRule({
    this.id,
    this.leavePolicyId,
    this.companyId,
    this.name,
    this.description,
    this.internalCode,
    this.isPaid,
    this.progressPaymentDateDelay,
    this.limit,
    this.day,
    this.ageException,
    this.ageExceptionDayLimit,
    this.negativeBalance,
    this.negativeBalanceDayLimit,
    this.vestingFrequency,
    this.period,
    this.startDate,
    this.handover,
    this.handoverPaymentLimit,
    this.handoverLimit,
    this.handoverResetTime,
    this.seniority,
    this.demandMinimum,
    this.demandMaximum,
    this.calculationType,
    this.descriptionObligation,
    this.caregiverObligation,
    this.waitingTime,
    this.waitingMonth,
    this.overrideWorkSchedule,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory LeaveRule.fromJson(Map<String, dynamic> json) {
    return LeaveRule(
      id: json['id'],
      leavePolicyId: json['leave_policy_id'],
      companyId: json['company_id'],
      name: json['name'],
      description: json['description'],
      internalCode: json['internal_code'],
      isPaid: json['is_paid'],
      progressPaymentDateDelay: json['progress_payment_date_delay'],
      limit: json['limit'],
      day: json['day'],
      ageException: json['age_exception'],
      ageExceptionDayLimit: json['age_exception_day_limit'],
      negativeBalance: json['negative_balance'],
      negativeBalanceDayLimit: json['negative_balance_day_limit'],
      vestingFrequency: json['vesting_frequency'],
      period: json['period'],
      startDate: json['start_date'],
      handover: json['handover'],
      handoverPaymentLimit: json['handover_payment_limit'],
      handoverLimit: json['handover_limit'],
      handoverResetTime: json['handover_reset_time'],
      seniority: json['seniority'] != null
          ? List<dynamic>.from(json['seniority'])
          : null,
      demandMinimum: json['demand_minimum'],
      demandMaximum: json['demand_maximum'],
      calculationType: json['calculation_type'],
      descriptionObligation: json['description_obligation'],
      caregiverObligation: json['caregiver_obligation'],
      waitingTime: json['waiting_time'],
      waitingMonth: json['waiting_month'],
      overrideWorkSchedule: json['override_work_schedule'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'leave_policy_id': leavePolicyId,
      'company_id': companyId,
      'name': name,
      'description': description,
      'internal_code': internalCode,
      'is_paid': isPaid,
      'progress_payment_date_delay': progressPaymentDateDelay,
      'limit': limit,
      'day': day,
      'age_exception': ageException,
      'age_exception_day_limit': ageExceptionDayLimit,
      'negative_balance': negativeBalance,
      'negative_balance_day_limit': negativeBalanceDayLimit,
      'vesting_frequency': vestingFrequency,
      'period': period,
      'start_date': startDate,
      'handover': handover,
      'handover_payment_limit': handoverPaymentLimit,
      'handover_limit': handoverLimit,
      'handover_reset_time': handoverResetTime,
      'seniority': seniority,
      'demand_minimum': demandMinimum,
      'demand_maximum': demandMaximum,
      'calculation_type': calculationType,
      'description_obligation': descriptionObligation,
      'caregiver_obligation': caregiverObligation,
      'waiting_time': waitingTime,
      'waiting_month': waitingMonth,
      'override_work_schedule': overrideWorkSchedule,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}