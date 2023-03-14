import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/login_controller.dart';
import '../Models/selected_attendee.dart';
import '../NavBar Screens/all_events_screen.dart';
import '../NavBar Screens/mian_navbar_screen.dart';
import 'drawer_screen.dart';

class ShowDetailScreen extends StatefulWidget {
  String? pass;
  ShowDetailScreen({super.key, this.pass});

  @override
  State<ShowDetailScreen> createState() => _ShowDetailScreenState();
}

class _ShowDetailScreenState extends State<ShowDetailScreen> {
  CollectionReference eventRef =
      FirebaseFirestore.instance.collection("events");
  CollectionReference eventRef1 =
      FirebaseFirestore.instance.collection("selectedAttendee");

  SelectedAttendeeModel? obj;
  User? user = FirebaseAuth.instance.currentUser;

  // TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 56, 171, 216),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "All Events",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      body: Column(
        children: [
          const Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 10),
            child: Text(
              "Here are the Event-ID's .Tap any of them which you want to attend.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          FutureBuilder(
              future: eventRef1.where('uid', isEqualTo: user!.uid).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Center(
                      child: Text(
                    'No data found',
                    style: TextStyle(color: Colors.black),
                  ));
                } else {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'You are not selected for any Event!',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        SelectedAttendeeModel obj =
                            SelectedAttendeeModel.fromDocumentSnapshot(
                                doc: snapshot.data!.docs[index]);
                        return Column(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 56, 171, 216),
                                ),
                                onPressed: () async {
                                  Get.to(AllEvents(
                                    event_id: obj.event_id,
                                  ));
                                },
                                child: Container(
                                    height: 17,
                                    width: 80,
                                    child: Text(obj.event_id))),
                          ],
                        );
                      },
                    );
                  }
                }
              })
        ],
      ),
    );
  }
}
