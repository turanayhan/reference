// leave_form_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/riverpod/leave_policiy_provider.dart';

final selectedLeaveTypeProvider = StateProvider<String?>((ref) => null);
final startDateProvider = StateProvider<DateTime?>((ref) => null);
final endDateProvider = StateProvider<DateTime?>((ref) => null);
final returnDateProvider = StateProvider<DateTime?>((ref) => null);
final descriptionProvider = StateProvider<String>((ref) => '');

final totalLeaveDaysProvider = Provider<int>((ref) {
  final start = ref.watch(startDateProvider);
  final end = ref.watch(endDateProvider);
  if (start != null && end != null) {
    return end.difference(start).inDays + 1;
  }
  return 0;
});

final leaveTypesProvider = Provider<List<String>>((ref) {
  final leavePoliciesAsync = ref.watch(leavePolicyProvider);
  return leavePoliciesAsync.maybeWhen(
    data: (policies) {
      final names = <String>{};
      for (final policy in policies) {
        for (final rule in policy.leaveRules ?? []) {
          if (rule.name != null) names.add(rule.name!);
        }
      }
      return names.toList();
    },
    orElse: () => [],
  );
});