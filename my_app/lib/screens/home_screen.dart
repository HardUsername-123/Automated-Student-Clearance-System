import 'dart:io' show Platform; // Import dart:io safely
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/layouts/build_mobile_layout.dart';
import 'package:my_app/layouts/build_desktop_layout.dart';
import 'package:my_app/screens/dept_clearance.dart';
import 'package:my_app/screens/home_dashboard.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/sms_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeDashboard(),
    DeptClearance(),
    SmsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool get isDesktop {
    try {
      return kIsWeb || Platform.isWindows;
    } catch (e) {
      return kIsWeb; // Fallback for web where Platform.isWindows isn't available
    }
  }

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? BuildDesktopLayout(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
          screens: _screens,
        )
        : BuildMobileLayout(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
          screens: _screens,
        );
  }
}
