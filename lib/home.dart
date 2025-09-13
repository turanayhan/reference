import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/custom_app_bar.dart';
import 'package:view_ref/home_widget/search_widget.dart';
import 'package:view_ref/mixin_home.dart';
import 'package:view_ref/profile_menu.dart';
import 'package:view_ref/riverpod/employe_provider.dart';
import 'package:view_ref/riverpod/theme_provider.dart';
import 'package:view_ref/app_color.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with EmployeeListMixin<Home> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final employees = ref.watch(employeeProvider);
    final visibleEmployees = getVisibleEmployees(employees);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ana Sayfa',
        customTitle: isSearching
            ? SearchBarField(
                controller: searchController,
                onClose: stopSearch,
                onChanged: (value) {
                  ref.read(employeeProvider.notifier).filter(value);
                  setState(() => currentMax = itemsPerPage);
                },
              )
            : null,
        actions: [
          if (!isSearching)
            IconButton(
              icon: Icon(Icons.search, color: AppColors.iconSelected(themeMode)),
              onPressed: startSearch,
            ),
        ],
        showThemeButton: true,
        profileAvatar: ProfileMenuButton(onSelected: (value) {}),
        backgroundColor: AppColors.backgroundWhite(themeMode),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            loadMore(employees);
          }
          return false;
        },
        child: ListView.builder(
          itemCount: visibleEmployees.length + 1,
          itemBuilder: (context, index) {
            if (index == visibleEmployees.length) {
              return isLoadingMore
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox.shrink();
            }
            final employee = visibleEmployees[index];
            return Card(
              color: AppColors.cardDefaultColor(themeMode),
              child: ListTile(
                title: Text(employee.name, style: TextStyle(color: AppColors.textPrimary(themeMode))),
                subtitle: Text('${employee.department} - ${employee.description}',
                    style: TextStyle(color: AppColors.textUnselected(themeMode))),
              ),
            );
          },
        ),
      ),
      backgroundColor: AppColors.backgroundWhite(themeMode),
    );
  }
}