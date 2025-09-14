import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/home.dart';
import 'package:view_ref/screen/leave_page.dart';
import 'package:view_ref/riverpod/theme_provider.dart';
import 'package:view_ref/app_string.dart';
import 'package:view_ref/nav_bar.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late AnimationController _controller;
  bool _isNavBarVisible = true;
  DateTime _lastToggle = DateTime.now();

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    5,
    (index) => GlobalKey<NavigatorState>(),
  );

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home_outlined, 'label': AppStrings.home},
    {'icon': Icons.event, 'label': AppStrings.leave},
    {'icon': Icons.access_time, 'label': "Mesai"},
    {'icon': Icons.receipt_long_outlined, 'label': AppStrings.payroll},
    {'icon': Icons.account_balance_wallet, 'label': "Harcama"},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  Widget _buildOffstageNavigator(int index) {
  ref.watch(themeProvider);
    
    return Offstage(
      offstage: _selectedIndex != index,
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (settings) {
            late Widget child;
            switch (index) {
              case 0:
                child = const Home();
                break;
              case 1:
                child = const CreateLeavePage();
                break;
              case 2:
                child = const Center(child: Text('Mesai Sayfası'));
                break;
              case 3:
                child = const Center(child: Text('Maaş Bordrosu'));
                break;
              case 4:
                child = const Center(child: Text('Harcama Sayfası'));
                break;
            }
            return MaterialPageRoute(builder: (_) => child, settings: settings);
          },
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final double? delta = notification.scrollDelta;
      final timeSinceLast = DateTime.now().difference(_lastToggle);

      if (delta != null && timeSinceLast > const Duration(milliseconds: 100)) {
        if (delta > 0 && _isNavBarVisible) {
          setState(() {
            _isNavBarVisible = false;
            _lastToggle = DateTime.now();
          });
        } else if (delta < 0 && !_isNavBarVisible) {
          setState(() {
            _isNavBarVisible = true;
            _lastToggle = DateTime.now();
          });
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    AppColors.setThemeMode(themeMode);

    return WillPopScope(
      onWillPop: () async {
        final isFirst = !await _navigatorKeys[_selectedIndex].currentState!
            .maybePop();
        return isFirst;
      },
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: List.generate(5, (i) => _buildOffstageNavigator(i)),
        ),
        bottomNavigationBar: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          offset: _isNavBarVisible ? Offset.zero : const Offset(0, 1),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isNavBarVisible ? 1 : 0,
            child: CustomNavigationBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
              menuItems: menuItems,
            ),
          ),
        ),
      ),
    );
  }
}
