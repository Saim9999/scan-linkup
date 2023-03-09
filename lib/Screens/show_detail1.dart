import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Models/selected_attendee.dart';
import '../NavBar Screens/all_events_screen.dart';

class ShowDetailScreen extends StatefulWidget {
  const ShowDetailScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 56, 171, 216),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Show Events",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: eventRef1.where('uid', isEqualTo: user!.uid).get(),
            builder: (context, snapshot) {
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
                      Text(obj.event_id),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(
                              AllEvents(
                              event_id: obj.event_id,
                            )
                            );
                          },
                          child: Text("NEXT"))
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

