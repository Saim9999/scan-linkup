import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_linkup_app/Screens/drawer_screen.dart';


class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: Color.fromARGB(255, 56, 171, 216),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Scan QR Code",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(
              'assets/images/Group 16 (1).png',
              height: 300,
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                height: 30.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 56, 170, 215),
                    borderRadius: BorderRadius.circular(4)),
                child: TextButton(
                    onPressed: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (_){
                      //   return SponsorImage();
                      // }));
                    },
                    child: Center(
                        child: Text(
                      'SCAN CODE',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
