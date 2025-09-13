// home.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/custom_app_bar.dart';
import 'package:view_ref/home_widget/search_widget.dart';
import 'package:view_ref/profile_menu.dart';
import 'package:view_ref/riverpod/employe_provider.dart';
import 'package:view_ref/riverpod/theme_provider.dart';
import 'package:view_ref/app_color.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _startSearch() => setState(() => _isSearching = true);

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      ref.read(employeeProvider.notifier).filter('');
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final employees = ref.watch(employeeProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ana Sayfa',
        showBackButton: false,
        leadingIcon: Icons.home_outlined,
        customTitle: _isSearching
            ? SearchBarField(
                controller: _searchController,
                onClose: _stopSearch,
                onChanged: (value) =>
                    ref.read(employeeProvider.notifier).filter(value),
              )
            : null,
        actions: [
          if (!_isSearching)
            IconButton(
              icon: Icon(
                Icons.search,
                color: AppColors.iconSelected(themeMode),
              ),
              onPressed: _startSearch,
            ),
        ],
          showThemeButton: true, // sadece bu sayfada göster

        profileAvatar: ProfileMenuButton(onSelected: (value) {}),
        backgroundColor: AppColors.backgroundWhite(themeMode),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Card(
            color: AppColors.cardDefaultColor(themeMode),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  '${employee.id}',
                  style:
                      TextStyle(color: AppColors.textPrimary(themeMode)),
                ),
              ),
              title: Text(
                employee.name,
                style: TextStyle(color: AppColors.textPrimary(themeMode)),
              ),
              subtitle: Text(
                '${employee.department} - ${employee.description}',
                style: TextStyle(color: AppColors.textUnselected(themeMode)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.iconUnselected(themeMode),
              ),
              onTap: () {},
            ),
          );
        },
      ),
      backgroundColor: AppColors.backgroundWhite(themeMode),
    );
  }
}