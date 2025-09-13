import 'package:flutter_riverpod/flutter_riverpod.dart';

// Tüm çalışan listesi
final List<Employee> _initialEmployees = List.generate(
  100,
  (index) => Employee(
    id: index + 1,
    name: 'Çalışan ${index + 1}',
    department: index % 2 == 0 ? 'İK' : 'Finans',
    description: 'Açıklama ${index + 1}',
  ),
);

// StateNotifier ile yönetim
class EmployeeNotifier extends StateNotifier<List<Employee>> {
  EmployeeNotifier() : super(_initialEmployees);

  // Arama filtreleme
  void filter(String query) {
    if (query.isEmpty) {
      state = _initialEmployees;
      return;
    }

    final filtered = _initialEmployees.where((employee) {
      final nameLower = employee.name.toLowerCase();
      final deptLower = employee.department.toLowerCase();
      final descLower = employee.description.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower) ||
          deptLower.contains(searchLower) ||
          descLower.contains(searchLower);
    }).toList();

    state = filtered;
  }
}

// Provider
final employeeProvider =
    StateNotifierProvider<EmployeeNotifier, List<Employee>>(
        (ref) => EmployeeNotifier());



 class Employee {
  final int id;
  final String name;
  final String department;
  final String description;

  Employee({
    required this.id,
    required this.name,
    required this.department,
    required this.description,
  });
}