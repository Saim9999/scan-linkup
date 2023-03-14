import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_linkup_app/NavBar%20Screens/profile_screen.dart';
import '../Controllers/login_controller.dart';
import '../Screens/qr_scan_screen.dart';
import '../Screens/show_detail1.dart';
import 'all_events_screen.dart';
import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  final List<Widget>
  mainScreens = [
    const Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const QRScreen(),
    const SearchEvents(),
    const Text('Cash out Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ShowDetailScreen(),
    //  AllEvents(),
   UserProfileData(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
                labelStyle: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                unselectedLabelColor: const Color.fromARGB(255, 56, 171, 216),
                isScrollable: false,
                controller: tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
