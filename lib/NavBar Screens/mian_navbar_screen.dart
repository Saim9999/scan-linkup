import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_linkup_app/NavBar%20Screens/event_screen.dart';
import 'package:scanner_linkup_app/NavBar%20Screens/rough_screen.dart';

import '../Screens/qr_scan_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final List<Widget> mainScreens = [

    const Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    // const ScanPassScreen(),
    QRScreen(),
    const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Cashout Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const EventScreen(),
    const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: mainScreens,
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Material(
            child: BottomAppBar(
              // notchMargin: 8,
              shape: const CircularNotchedRectangle(),
              child: TabBar(
                tabs: const [
                  Tab(
                      icon: ImageIcon(AssetImage('assets/images/Group.png'),
                          size: 40),
                      text: 'Home'),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/Group 5 copy.png'),
                        size: 40),
                    text: 'Scan',
                  ),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/Group 5 copy 2.png'),
                        size: 40),
                    text: 'Search',
                  ),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/Group 5 copy 3.png'),
                        size: 40),
                    text: 'Cashout',
                  ),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/Group 5 copy 4.png'),
                        size: 40),
                    text: 'Events',
                  ),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/Group 5 copy 5.png'),
                        size: 40),
                    text: 'Profile',
                  )
                ],
                labelStyle:
                    TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                unselectedLabelColor: const Color.fromARGB(255, 56, 171, 216),
                isScrollable: false,
                // indicatorSize: TabBarIndicatorSize.tab,
                // indicatorPadding: EdgeInsets.all(5.0),
                // indicatorColor: Color.fromARGB(255, 124, 97, 65),
                controller: tabController,
                // indicator: UnderlineTabIndicator(
                //   insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 75.0),
                //   borderSide: BorderSide(
                //       color: Color.fromARGB(255, 124, 97, 65), width: 3),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
