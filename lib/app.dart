import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:edoc/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_view.dart';
import 'profile_view.dart';
import 'search_view.dart';

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool ismobile = MediaQuery.of(context).size.width < 500;
    PageController pageController = PageController();
    SideMenuController sideMenuController = SideMenuController();
    List<SideMenuItem> sideMenuItems = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'Dashboard',
        onTap: (index, _) => sideMenuController.changePage(index),
        icon: const Icon(Icons.dashboard),
      ),
      SideMenuItem(
        priority: 1,
        title: 'Search',
        onTap: (index, _) => sideMenuController.changePage(index),
        icon: const Icon(Icons.search),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Notifications',
        onTap: (index, _) => sideMenuController.changePage(index),
        icon: const Icon(Icons.notifications),
      ),
      SideMenuItem(
        priority: 3,
        title: 'Profile',
        onTap: (index, _) => sideMenuController.changePage(index),
        icon: const Icon(Icons.person),
      ),
    ];
    sideMenuController.addListener((p0) {
      pageController.jumpToPage(p0);
    });

    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ismobile != true
            ? SideMenu(
                items: sideMenuItems,
                controller: sideMenuController,
                style: SideMenuStyle(
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: Colors.blue[100],
                  selectedColor: Colors.blue[600],
                  selectedTitleTextStyle: const TextStyle(color: Colors.white),
                  selectedIconColor: Colors.white,
                  unselectedIconColor: Colors.white70,
                  unselectedTitleTextStyle:
                      const TextStyle(color: Colors.white70),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 79, 117, 134),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ]),
                  backgroundColor: const Color.fromARGB(255, 79, 117, 134),
                  // openSideMenuWidth: 200
                ),
              )
            : Container(),
        Expanded(
            child: PageView(
          controller: pageController,
          children: const [
            DashboardView(),
            SearchView(),
            NotificationsView(),
            ProfileView()
          ],
        ))
      ]),
      bottomNavigationBar: ismobile
          ? BottomNavigationBar(
              currentIndex:
                  _BottomNavBarItems.values.indexOf(ref.watch(currentPage)),
              onTap: (selected) {
                ref.watch(currentPage.notifier).state =
                    _BottomNavBarItems.values[selected];
              },
              items: _BottomNavBarItems.values.map((e) {
                Widget icon = const Icon(Icons.person);
                String label = '';
                switch (e) {
                  case _BottomNavBarItems.dashboard:
                    icon = const Icon(Icons.dashboard);
                    label = 'Dashbaord';
                    break;
                  case _BottomNavBarItems.search:
                    icon = const Icon(Icons.search);
                    label = 'Search';
                    break;
                  case _BottomNavBarItems.notifications:
                    icon = const Icon(Icons.notifications);
                    label = 'Notifications';
                    break;
                  case _BottomNavBarItems.profile:
                    icon = const Icon(Icons.person);
                    label = 'Profile';
                    break;
                }
                return BottomNavigationBarItem(icon: icon, label: label);
              }).toList())
          : null,
    );
  }
}

enum _BottomNavBarItems { dashboard, search, notifications, profile }

final currentPage = StateProvider((ref) => _BottomNavBarItems.dashboard);
