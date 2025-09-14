

import 'package:view_ref/model/leave_model.dart';

class LeaveData {
  int? id;
  int? employeeId;
  int? companyId;
  int? leavePolicyId;
  int? leaveRuleId;
  int? days;
  String? startDate;
  String? endDate;
  String? description;
  String? status;
  int? caregiverId;
  String? returnDate;
  int? skipApproval;
  int? notifyEmployee;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Employee? employee;
  Company? company;
  LeavePolicy? leavePolicy;
  LeaveRule? leaveRule;
  Caregiver? caregiver;
  ApprovalFlow? approvalFlow;

  LeaveData({
    this.id,
    this.employeeId,
    this.companyId,
    this.leavePolicyId,
    this.leaveRuleId,
    this.days,
    this.startDate,
    this.endDate,
    this.description,
    this.status,
    this.caregiverId,
    this.returnDate,
    this.skipApproval,
    this.notifyEmployee,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.employee,
    this.company,
    this.leavePolicy,
    this.leaveRule,
    this.caregiver,
    this.approvalFlow,
  });

  factory LeaveData.fromJson(Map<String, dynamic> json) {
    return LeaveData(
      id: json['id'] != null ? (json['id'] as num).toInt() : null,
      employeeId: json['employee_id'] != null
          ? (json['employee_id'] as num).toInt()
          : null,
      companyId: json['company_id'] != null
          ? (json['company_id'] as num).toInt()
          : null,
      leavePolicyId: json['leave_policy_id'] != null
          ? (json['leave_policy_id'] as num).toInt()
          : null,
      leaveRuleId: json['leave_rule_id'] != null
          ? (json['leave_rule_id'] as num).toInt()
          : null,
      days: json['days'] != null ? (json['days'] as num).toInt() : null,
      caregiverId: json['caregiver_id'] != null
          ? (json['caregiver_id'] as num).toInt()
          : null,
      skipApproval: json['skip_approval'] != null
          ? (json['skip_approval'] as num).toInt()
          : null,
      notifyEmployee: json['notify_employee'] != null
          ? (json['notify_employee'] as num).toInt()
          : null,
      startDate: json['start_date'],
      endDate: json['end_date'],
      description: json['description'],
      status: json['status'],
      returnDate: json['return_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      employee: json['employee'] != null
          ? Employee.fromJson(json['employee'])
          : null,
      company: json['company'] != null
          ? Company.fromJson(json['company'])
          : null,
      leavePolicy: json['leave_policy'] != null
          ? LeavePolicy.fromJson(json['leave_policy'])
          : null,
      leaveRule: json['leave_rule'] != null
          ? LeaveRule.fromJson(json['leave_rule'])
          : null,
      caregiver: json['caregiver'] != null
          ? Caregiver.fromJson(json['caregiver'])
          : null,
      approvalFlow: json['approval_flow'] != null
          ? ApprovalFlow.fromJson(json['approval_flow'])
          : null,
    );
  }
}



class Employee {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? isActive;
  String? role;
  int? selectedCompany;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? workflowId;
  List<Career>? careers;

  Employee({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isActive,
    this.role,
    this.selectedCompany,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.workflowId,
    this.careers,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      isActive: json['is_active'],
      role: json['role'],
      selectedCompany: json['selected_company'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      workflowId: json['workflow_id'],
      careers: json['careers'] != null
          ? List<Career>.from(json['careers'].map((x) => Career.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'is_active': isActive,
      'role': role,
      'selected_company': selectedCompany,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'workflow_id': workflowId,
      'careers': careers?.map((x) => x.toJson()).toList(),
    };
  }
}

class Company {
  int? id;
  String? uuid;
  String? name;
  String? email;
  String? phone;
  String? logo;
  String? mersisNumber;
  String? sgkNumber;
  String? taxNumber;
  String? city;
  String? district;
  String? taxOffice;
  String? address;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Company({
    this.id,
    this.uuid,
    this.name,
    this.email,
    this.phone,
    this.logo,
    this.mersisNumber,
    this.sgkNumber,
    this.taxNumber,
    this.city,
    this.district,
    this.taxOffice,
    this.address,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      logo: json['logo'],
      mersisNumber: json['mersis_number'],
      sgkNumber: json['sgk_number'],
      taxNumber: json['tax_number'],
      city: json['city'],
      district: json['district'],
      taxOffice: json['tax_office'],
      address: json['address'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'email': email,
      'phone': phone,
      'logo': logo,
      'mersis_number': mersisNumber,
      'sgk_number': sgkNumber,
      'tax_number': taxNumber,
      'city': city,
      'district': district,
      'tax_office': taxOffice,
      'address': address,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}



class CompanyUnit {
  int? id;
  int? companyId;
  int? parentId;
  int? organizationUnitId;
  int? holidayId;
  int? permitApprovalId;
  int? advanceApprovalId;
  int? expenditureApprovalId;
  int? overtimeApprovalId;
  String? name;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CompanyUnit({
    this.id,
    this.companyId,
    this.parentId,
    this.organizationUnitId,
    this.holidayId,
    this.permitApprovalId,
    this.advanceApprovalId,
    this.expenditureApprovalId,
    this.overtimeApprovalId,
    this.name,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory CompanyUnit.fromJson(Map<String, dynamic> json) {
    return CompanyUnit(
      id: json['id'],
      companyId: json['company_id'],
      parentId: json['parent_id'],
      organizationUnitId: json['organization_unit_id'],
      holidayId: json['holiday_id'],
      permitApprovalId: json['permit_approval_id'],
      advanceApprovalId: json['advance_approval_id'],
      expenditureApprovalId: json['expenditure_approval_id'],
      overtimeApprovalId: json['overtime_approval_id'],
      name: json['name'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'parent_id': parentId,
      'organization_unit_id': organizationUnitId,
      'holiday_id': holidayId,
      'permit_approval_id': permitApprovalId,
      'advance_approval_id': advanceApprovalId,
      'expenditure_approval_id': expenditureApprovalId,
      'overtime_approval_id': overtimeApprovalId,
      'name': name,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}


class Caregiver {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? isActive;
  String? role;
  int? selectedCompany;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? workflowId;

  Caregiver({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isActive,
    this.role,
    this.selectedCompany,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.workflowId,
  });

  factory Caregiver.fromJson(Map<String, dynamic> json) {
    return Caregiver(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      isActive: json['is_active'],
      role: json['role'],
      selectedCompany: json['selected_company'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      workflowId: json['workflow_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'is_active': isActive,
      'role': role,
      'selected_company': selectedCompany,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'workflow_id': workflowId,
    };
  }
}




class ApprovalFlow {
  int? id;
  int? companyId;
  String? approvableType;
  int? approvableId;
  int? approvalProcessId;
  String? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<ApprovalStep>? steps;

  ApprovalFlow({
    this.id,
    this.companyId,
    this.approvableType,
    this.approvableId,
    this.approvalProcessId,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.steps,
  });

  factory ApprovalFlow.fromJson(Map<String, dynamic> json) {
    return ApprovalFlow(
      id: json['id'],
      companyId: json['company_id'],
      approvableType: json['approvable_type'],
      approvableId: json['approvable_id'],
      approvalProcessId: json['approval_process_id'],
      status: json['status'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      steps: json['steps'] != null
          ? List<ApprovalStep>.from(
              json['steps'].map((x) => ApprovalStep.fromJson(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'approvable_type': approvableType,
      'approvable_id': approvableId,
      'approval_process_id': approvalProcessId,
      'status': status,
      'created_by': createdBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'steps': steps?.map((x) => x.toJson()).toList(),
    };
  }
}


class ApprovalStep {
  int? id;
  int? approvalFlowId;
  int? stepOrder;
  int? employeeId;
  String? status;
  String? comment;
  String? actionDate;
  String? createdAt;
  String? updatedAt;
  Employee? employee;

  ApprovalStep({
    this.id,
    this.approvalFlowId,
    this.stepOrder,
    this.employeeId,
    this.status,
    this.comment,
    this.actionDate,
    this.createdAt,
    this.updatedAt,
    this.employee,
  });

  factory ApprovalStep.fromJson(Map<String, dynamic> json) {
    return ApprovalStep(
      id: json['id'],
      approvalFlowId: json['approval_flow_id'],
      stepOrder: json['step_order'],
      employeeId: json['employee_id'],
      status: json['status'],
      comment: json['comment'],
      actionDate: json['action_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      employee: json['employee'] != null
          ? Employee.fromJson(json['employee'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'approval_flow_id': approvalFlowId,
      'step_order': stepOrder,
      'employee_id': employeeId,
      'status': status,
      'comment': comment,
      'action_date': actionDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'employee': employee?.toJson(),
    };
  }
}



class Career {
  int? id;
  int? employeeId;
  int? companyId;
  Employee? manager;
  String? workType;
  String? startDate;
  String? endDate;
  int? isDefault;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<CareerValue>? careerValues;

  Career({
    this.id,
    this.employeeId,
    this.companyId,
    this.manager,
    this.workType,
    this.startDate,
    this.endDate,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.careerValues,
  });

  factory Career.fromJson(Map<String, dynamic> json) {
    return Career(
      id: json['id'],
      employeeId: json['employee_id'],
      companyId: json['company_id'],
      manager: json['manager'] != null
          ? Employee.fromJson(json['manager'])
          : null,
      workType: json['work_type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      isDefault: json['is_default'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      careerValues: json['career_values'] != null
          ? (json['career_values'] as List)
                .map((e) => CareerValue.fromJson(e))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_id': employeeId,
      'company_id': companyId,
      'manager': manager?.toJson(),
      'work_type': workType,
      'start_date': startDate,
      'end_date': endDate,
      'is_default': isDefault,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'career_values': careerValues?.map((e) => e.toJson()).toList(),
    };
  }
}



class CareerValue {
  int? id;
  int? careerId;
  int? organizationUnitId;
  int? companyUnitId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  OrganizationUnit? organizationUnit;
  CompanyUnit? companyUnit;

  CareerValue({
    this.id,
    this.careerId,
    this.organizationUnitId,
    this.companyUnitId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.organizationUnit,
    this.companyUnit,
  });

  factory CareerValue.fromJson(Map<String, dynamic> json) {
    return CareerValue(
      id: json['id'],
      careerId: json['career_id'],
      organizationUnitId: json['organization_unit_id'],
      companyUnitId: json['company_unit_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      organizationUnit: json['organization_unit'] != null
          ? OrganizationUnit.fromJson(json['organization_unit'])
          : null,
      companyUnit: json['company_unit'] != null
          ? CompanyUnit.fromJson(json['company_unit'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'career_id': careerId,
      'organization_unit_id': organizationUnitId,
      'company_unit_id': companyUnitId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'organization_unit': organizationUnit?.toJson(),
      'company_unit': companyUnit?.toJson(),
    };
  }
}

class OrganizationUnit {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? companyId;
  int? order;
  String? deletedAt;

  OrganizationUnit({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.companyId,
    this.order,
    this.deletedAt,
  });

  factory OrganizationUnit.fromJson(Map<String, dynamic> json) {
    return OrganizationUnit(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      companyId: json['company_id'],
      order: json['order'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'company_id': companyId,
      'order': order,
      'deleted_at': deletedAt,
    };
  }
}