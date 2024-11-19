import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/screens/user_screens/home_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/user_screens/message_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/user_screens/order_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/user_screens/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final RxInt _selectedIndex = 0.obs;

  void _onChangedIndex(int index) {
    _selectedIndex.value = index;
  }

  final _bottomNavScreens = [
    const HomeScreen(),
    const ProfileScreen(),
    const OrderScreen(),
    const MessageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _bottomNavScreens[_selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              animationDuration: const Duration(milliseconds: 400),
              selectedIndex: _selectedIndex.value,
              onDestinationSelected: _onChangedIndex,
              destinations: [
                const NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.home,
                  ),
                  label: "Home",
                ),
                const NavigationDestination(
                    icon: Icon(CupertinoIcons.person), label: "Profile"),
                const NavigationDestination(
                    icon: Badge(
                        backgroundColor: Colors.red,
                        label: Text("3"),
                        child: Icon(CupertinoIcons.cart)),
                    label: "Orders"),
                NavigationDestination(
                    icon: Badge(
                        backgroundColor: Colors.red,
                        label: Text(DummyData.messages.length.toString()),
                        child: const Icon(CupertinoIcons.chat_bubble_text)),
                    label: "Messages"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
