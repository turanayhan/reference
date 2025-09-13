// dashboard.dart
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

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  OverlayEntry? _overlayEntry;
  late AnimationController _controller;
  late Animation<double> _animation;
  final GlobalKey _navbarKey = GlobalKey();

  bool _isNavBarVisible = true;
  DateTime _lastToggle = DateTime.now();

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Text("Leave Page"),
    const Text("Add Page"),
    const Text('Schedule Page'),
    const Text('Settings Page'),
  ];

  late List<Map<String, dynamic>> popupMenuItems;

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home_outlined, 'label': AppStrings.home},
    {'icon': Icons.event, 'label': AppStrings.leave},
    {'icon': Icons.add, 'label': "Ekle"},
    {'icon': Icons.receipt_long_outlined, 'label': AppStrings.payroll},
    {'icon': Icons.settings_outlined, 'label': AppStrings.settings},
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _removeOverlay();
  }

  void _toggleMenu(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlay(context);
      Overlay.of(context)!.insert(_overlayEntry!);
      _controller.forward();
    } else {
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    _controller.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  OverlayEntry _createOverlay(BuildContext context) {
    final themeMode = ref.read(themeProvider); // ThemeMode al
    final Size screenSize = MediaQuery.of(context).size;
    final RenderBox? navbarBox =
        _navbarKey.currentContext?.findRenderObject() as RenderBox?;
    final double navbarHeight = navbarBox?.size.height ?? context.dynamicHeight(0.09);
    final double bottomPadding =
        MediaQuery.of(context).padding.bottom + navbarHeight + context.lowValue;

    // popup menü renklerini ThemeMode ile al
    popupMenuItems = [
      {
        'icon': Icons.request_page,
        'label': 'İzin Talep Et',
        'color': AppColors.iconSelected(themeMode),
        'bgColor': AppColors.backgroundWhite(themeMode),
      },
      {
        'icon': Icons.monetization_on,
        'label': 'Avans',
        'color': AppColors.iconSelected(themeMode),
        'bgColor': AppColors.backgroundWhite(themeMode),
      },
      {
        'icon': Icons.more_horiz,
        'label': 'Diğer',
        'color': AppColors.iconSelected(themeMode),
        'bgColor': AppColors.backgroundWhite(themeMode),
      },
    ];

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            Positioned(
              bottom: bottomPadding,
              left: (screenSize.width - context.dynamicWidth(0.4)) / 2,
              child: Material(
                color: Colors.transparent,
                child: FadeTransition(
                  opacity: _animation,
                  child: ScaleTransition(
                    scale: _animation,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: popupMenuItems
                          .map((item) => PopupMenuItemWidget(
                                item: item,
                                onTap: () {
                                  _removeOverlay();
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(context.dynamicHeight(0.03))),
                                    ),
                                    builder: (context) =>
                                        DashboardBottomSheet(item: item),
                                  );
                                },
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final double? delta = notification.scrollDelta;
      if (delta != null) {
        final timeSinceLast = DateTime.now().difference(_lastToggle);
        if (delta > 0 && _isNavBarVisible &&
            timeSinceLast > const Duration(milliseconds: 100)) {
          setState(() {
            _isNavBarVisible = false;
            _lastToggle = DateTime.now();
          });
        } else if (delta < 0 && !_isNavBarVisible &&
            timeSinceLast > const Duration(milliseconds: 100)) {
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
    final themeMode = ref.watch(themeProvider); // ThemeMode al
    final sidebarBg = AppColors.sidebarBackground(themeMode);
    final selectedBg = AppColors.selectedItemBackground(themeMode);
    final iconSelected = AppColors.iconSelected(themeMode);
    final iconUnselected = AppColors.iconUnselected(themeMode);
    final textUnselected = AppColors.textUnselected(themeMode);

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
                  if (index == 2) {
                    setState(() => _selectedIndex = 2);
                    _toggleMenu(context);
                  } else {
                    _onItemTapped(index);
                  }
                },
                menuItems: menuItems.map((item) {
                  return {
                    'icon': item['icon'],
                    'label': item['label'],
                    'bgColor': _selectedIndex == menuItems.indexOf(item)
                        ? selectedBg
                        : sidebarBg,
                    'iconColor': _selectedIndex == menuItems.indexOf(item)
                        ? iconSelected
                        : iconUnselected,
                    'textColor': _selectedIndex == menuItems.indexOf(item)
                        ? iconSelected
                        : textUnselected,
                  };
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}