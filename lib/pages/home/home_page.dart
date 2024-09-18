import 'package:flutter/material.dart';
import 'package:sampleproject/pages/account/account_page.dart';
import 'package:sampleproject/pages/cart/cart_page.dart';
import 'package:sampleproject/utili/colors.dart';

import '../orders/orders.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const MainPage(),
    const Orders(),
    const CartPage(),
    const AccountPage()
    
  ];
  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.mainBlackColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              tooltip: "Home",
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              tooltip: "Orders",
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              tooltip: "Cart",
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              tooltip: "Profile",
              label: "Profile",
            ),
          ]),
    );
  }
}
