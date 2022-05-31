import 'package:flutter/material.dart';
import 'package:job_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:job_app/models/my_flutter_app_icons.dart';
import 'package:job_app/screens/screens.dart';

class NavigationBarManager extends StatefulWidget {
  const NavigationBarManager({Key? key}) : super(key: key);

  static const routeName = '/navigation';

  static List pages = [
    const HomeScreen(),
    Container(color: Colors.red),
    const ProfileScreen(),
    Container(color: Colors.orange),
  ];

  @override
  State<NavigationBarManager> createState() => _NavigationBarManagerState();
}

class _NavigationBarManagerState extends State<NavigationBarManager>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          body: NavigationBarManager.pages[tabManager.selectedTab],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: Colors.white,
            ),
            child: TabBar(
              onTap: (index) {
                tabManager.goToTab(index);
              },
              labelStyle: const TextStyle(
                fontSize: 12,
                color: Colors.teal,
                fontFamily: 'Poppins',
              ),
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.teal,
              indicatorWeight: 0.1,
              padding: const EdgeInsets.only(top: 15.0),
              tabs: [
                Tab(
                  icon: const Icon(MyFlutterApp.home),
                  child: tabsInfo(0, 'Home'),
                ),
                Tab(
                  icon: const Icon(MyFlutterApp.chat),
                  child: tabsInfo(1, 'Message'),
                ),
                Tab(
                  icon: const Icon(MyFlutterApp.profile),
                  child: tabsInfo(2, 'Profile'),
                ),
                Tab(
                    icon: const Icon(MyFlutterApp.setting),
                    child: tabsInfo(3, 'Settings'))
              ],
              controller: _controller,
            ),
          ),
          extendBody: true,
        );
      },
    );
  }

  Widget tabsInfo(int index, String name) {
    return Provider.of<TabManager>(context).selectedTab == index
        ? Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 15.0,
              child: Image.asset(
                'assets/icons/indicator.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        : Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              name,
              style: const TextStyle(color: Colors.grey),
            ),
        );
  }
}
