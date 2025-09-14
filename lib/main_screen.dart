import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/home.dart';
import 'package:view_ref/home_widget/bottom_sheet.dart';
import 'package:view_ref/home_widget/popub_menu_item.dart';
import 'package:view_ref/nav_bar.dart';
import 'package:view_ref/riverpod/theme_provider.dart';
import 'package:view_ref/app_string.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/screen/leave_page.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  final GlobalKey _navbarKey = GlobalKey();

  bool _isNavBarVisible = true;
  DateTime _lastToggle = DateTime.now();

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const CreateLeavePage(),
    const SizedBox.shrink(), // Popup açılacak yer
    const Text('Schedule Page'),
    const Text('Settings Page'),
  ];

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
    setState(() => _selectedIndex = index);
    _removeOverlay();
  }



  void _removeOverlay() {
    _controller.reverse().then((_) {
  
    });
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

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: _handleScrollNotification,
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _widgetOptions,
                  ),
                ),
              ),
            ],
          ),
          AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            offset: _isNavBarVisible ? Offset.zero : const Offset(0, 1),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isNavBarVisible ? 1 : 0,
              child: CustomNavigationBar(
                key: _navbarKey,
                selectedIndex: _selectedIndex,
                onItemTapped: (index) {
              
                    _onItemTapped(index);
                  
                },
                menuItems: menuItems,
                isMiddleSelected: _selectedIndex == 2,
                themeMode: themeMode, // <--- Tema desteği buradan veriliyor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
