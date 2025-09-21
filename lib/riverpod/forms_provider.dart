import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/model/leave_model.dart';
import 'package:view_ref/riverpod/leave_policiy_provider.dart';

final selectedLeaveRuleProvider = StateProvider<LeaveRule?>((ref) => null);
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

final leaveRulesProvider = Provider<List<LeaveRule>>((ref) {
  final leavePoliciesAsync = ref.watch(leavePolicyProvider);
  return leavePoliciesAsync.maybeWhen(
    data: (policies) {
      final rules = <LeaveRule>[];
      for (final policy in policies) {
        rules.addAll(policy.leaveRules ?? []);
      }
      return rules;
    },
    orElse: () => [],
  );
});


final totalLeaveDurationProvider = Provider<Duration?>((ref) {
  final start = ref.watch(startDateProvider);
  final end = ref.watch(endDateProvider);
  if (start != null && end != null) {
    return end.difference(start);
  }
  return null;
});