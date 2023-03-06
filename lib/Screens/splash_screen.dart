import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_linkup_app/Screens/scanner_login_screen.dart';


class WelcomeSplash extends StatefulWidget {
  const WelcomeSplash({super.key});

  @override
  State<WelcomeSplash> createState() => _WelcomeSplashState();
}

class _WelcomeSplashState extends State<WelcomeSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () => Navigator.push(context, MaterialPageRoute(builder: (_) {
        return const EmailLoginScreen();
      })),
    );
  }
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Group 10 (1).png'),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Center(
                    child: Text(
                      'Welcome to',
                      style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                      child: Image.asset(
                        'assets/images/Vector Smart Object (5).png',
                        height: 80.h,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}