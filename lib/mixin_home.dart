import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/riverpod/employe_provider.dart';

mixin EmployeeListMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  int itemsPerPage = 20;
  int currentMax = 20;
  bool isLoadingMore = false;

  void startSearch() => setState(() => isSearching = true);

  void stopSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      currentMax = itemsPerPage;
      ref.read(employeeProvider.notifier).filter('');
    });
  }

  void loadMore(List<Employee> allEmployees) {
    if (currentMax < allEmployees.length && !isLoadingMore) {
      setState(() => isLoadingMore = true);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          currentMax = (currentMax + itemsPerPage).clamp(0, allEmployees.length);
          isLoadingMore = false;
        });
      });
    }
  }

  List<Employee> getVisibleEmployees(List<Employee> allEmployees) {
    return allEmployees.take(currentMax).toList();
  }
}