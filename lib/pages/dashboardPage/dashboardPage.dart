import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:parkaid/pages/userPage/userPage.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int selectedTab = 0;


  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    print(arguments);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [if(selectedTab ==2) ...[
            const Expanded(child: UserPage()),
            ]],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: GNav(
              haptic: true,
              tabBorderRadius: 10,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 100),
              gap: 5,
              onTabChange: (value) {
                setState(() {
                  selectedTab = value;
                });
              },
              activeColor: const Color(0XFF0000CD),
              iconSize: 28,
              color: const Color(0xFF0E0E0E),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Orders',
                ),
                GButton(
                  icon: Icons.manage_accounts_outlined,
                  text: 'Profile',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
