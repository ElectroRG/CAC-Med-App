import 'package:cac_med_app/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';
import 'Medstore/med_shop_page.dart';
import 'Pages/chatbot_page.dart';
import 'Pages/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());


    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          indicatorColor: Color(0xFFB9D1EA),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home',),
            NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat',),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop',),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings',),
          ],
        ),
      ),
      body: Obx(() => PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        reverse: false,
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: controller.screens[controller.selectedIndex.value],
      )),
    );


  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Home_two(),
    Chatbot(),
    Medshop(),
    Settings(),
  ];

}