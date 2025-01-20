import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/pages/home_page.dart';
import 'package:tugas_mobile_firebase/pages/profile_page.dart';
import 'package:tugas_mobile_firebase/pages/reminder_form.dart';
import '../controllers/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [const HomePage(), ReminderForm(), ProfilePage()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            currentIndex: dashboardController.selectedIndex.value,
            onTap: dashboardController.changeMenu,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Reminder",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Profile",
              ),
            ],
          ),
        ),
      );
    });
  }
}
