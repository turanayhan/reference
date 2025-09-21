import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/model/leave_model.dart';


class LeavePolicyNotifier extends StateNotifier<AsyncValue<List<LeavePolicy>>> {
  LeavePolicyNotifier() : super(const AsyncValue.loading()) {
    fetchLeavePolicies(); // init'te veriyi dolduralım
  }

  Future<void> fetchLeavePolicies() async {
    await Future.delayed(const Duration(milliseconds: 500)); // loading simülasyonu

    try {
      final mockPolicies = [
        LeavePolicy(
          id: 1,
          companyId: 101,
          name: "Yıllık İzin",
          description: "Çalışanların yıllık izin politikası",
          isDefault: 1,
          leaveRules: [
            LeaveRule(
              id: 1,
              leavePolicyId: 1,
              companyId: 101,
              name: "Ücretli",
              description: "Her yıl 14 gün",
              day: 14,
              isPaid: "yes",
              limit: "yearly",
              createdAt: DateTime.now().toIso8601String(),
            ),
          ],
        ),
        LeavePolicy(
          id: 2,
          companyId: 101,
          name: "Hastalık İzni",
          description: "Raporlu izinler",
          isDefault: 0,
          leaveRules: [
            LeaveRule(
              id: 2,
              leavePolicyId: 2,
              companyId: 101,
              name: "ücretsiz",
              description: "Yılda 5 gün",
              day: 5,
              isPaid: "yes",
              limit: "yearly",
              createdAt: DateTime.now().toIso8601String(),
            ),
          ],
        ),
      ];

      state = AsyncValue.data(mockPolicies);
    } catch (e, st) {
      state = AsyncValue.error("Mock veriler yüklenemedi: $e", st);
    }
  }
}

/// Provider
final leavePolicyProvider =
    StateNotifierProvider<LeavePolicyNotifier, AsyncValue<List<LeavePolicy>>>(
  (ref) => LeavePolicyNotifier(),
);