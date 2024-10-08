import 'package:eco_grow/core/components/app_bar_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/features/mobile/create_campaign/create_campaign_screen.dart';
import 'package:eco_grow/features/mobile/donation_history/donation_history_screen.dart';
import 'package:eco_grow/features/mobile/profile/profile_screen.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:eco_grow/features/mobile/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DonationHistoryScreen(),
    const CreateCampaignScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppbarCustom(
            logoImg: Assets.icons.logo.path,
            actions: const [],
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'Create',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: AppColor.accentColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
