import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scanner_linkup_app/Screens/scanner_login_screen.dart';
import 'package:scanner_linkup_app/Screens/show_detail1.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const EmailLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: const Color.fromARGB(253, 0, 174, 227),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Image.asset(
                      'assets/images/imgpsh_fullsize_anim.png',
                      height: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/home.png',
                    height: 15.h,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              const ListTile(
                visualDensity: VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    )),
                title: Text(
                  'Event Setting',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/calendar(2).png',
                    height: 15.h,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Events',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/scan.png',
                    height: 15.h,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Scan Ticket',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              ListTile(
                // onTap: () {
                //   Get.to(ShowDetailScreen());
                // },
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/settings(1).png',
                    color: Colors.white,
                    height: 15.h,
                  ),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/Group 17 (1).png',
                    height: 15.h,
                  ),
                ),
                title: const Text(
                  'Notification',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/control-center.png',
                    color: Colors.white,
                    height: 15.h,
                  ),
                ),
                title: const Text(
                  'Contact App Support',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              const ListTile(
                visualDensity: VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                title: Text(
                  'Search Event',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
              ListTile(
                onTap: () {
                  signOut();
                },
                visualDensity: const VisualDensity(horizontal: 4, vertical: -4),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/log-out.png',
                    color: Colors.white,
                    height: 15.h,
                  ),
                ),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
