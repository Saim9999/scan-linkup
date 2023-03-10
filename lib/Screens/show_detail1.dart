import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Models/selected_attendee.dart';
import '../NavBar Screens/all_events_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    String? enteredPassword = widget.pass;
    print(widget.pass);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 56, 171, 216),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
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
      body: ListView(
        children: [
          const Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 10),
            child: Text(
              "Here are the events. Enter the password same as login password & see details.",
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
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        SelectedAttendeeModel obj =
                            SelectedAttendeeModel.fromDocumentSnapshot(
                                doc: snapshot.data!.docs[index]);
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: TextFormField(
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return "Field Can't be Empty!";
                                      //   }
                                      //   return null;
                                      // },
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter event password',
                                      ),
                                      onChanged: (value) {
                                        enteredPassword = value;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 56, 171, 216),
                                        ),
                                        onPressed: () {
                                          if(!enteredPassword!.isEmpty)
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                  const SnackBar(
                                                    content:
                                                    Text('Incorrect password'),
                                                    elevation: 20,
                                                    duration: Duration(seconds: 3),
                                                  ),);
                                            }
                                          else if (enteredPassword == widget.pass) {
                                            print(obj.event_id);
                                            Get.to(AllEvents(
                                              event_id: obj.event_id,
                                            ));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Incorrect password'),
                                                elevation: 20,
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text("See Event")),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
