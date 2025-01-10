import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/src/screens/categories/categories_screen.dart';
import 'package:marvel/src/screens/downloads/downloads_screen.dart';
import 'package:marvel/src/screens/home/home_screen.dart';
import 'package:marvel/src/screens/settings/settings_screen.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/glassmorphism_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const DownloadsScreen(),
    const SettingsScreen(),
  ];

  final List<Map<String, String>> _navItems = [
    {'icon': AppAssets.homeIcon, 'label': 'Home'},
    {'icon': AppAssets.categoriesIcon, 'label': 'Categories'},
    {'icon': AppAssets.downloadsIcon, 'label': 'Downloads'},
    {'icon': AppAssets.settingsIcon, 'label': 'Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_currentIndex],
      bottomNavigationBar: GlassmorphismContainer(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor:
              const Color(0xFFED1B24), // Highlight color for selected icons
          unselectedItemColor: Colors.grey, // Color for unselected icons
          items: _navItems.map((item) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item['icon']!,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _currentIndex == _navItems.indexOf(item)
                      ? const Color(0xFFED1B24) // Active icon color
                      : Colors.grey, // Inactive icon color
                  BlendMode.srcIn,
                ),
              ),
              label: item['label'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
