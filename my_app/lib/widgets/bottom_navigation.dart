import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        index: selectedIndex,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.description, size: 30, color: Colors.white),
          Icon(Icons.edit_document, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: onItemTapped,
      ),
    );
  }
}
