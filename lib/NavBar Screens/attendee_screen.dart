import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/attendee_model.dart';
import '../Screens/drawer_screen.dart';

class AttendeesScreen extends StatefulWidget {
  String? takeId;
  AttendeesScreen({super.key, this.takeId});
  @override
  State<AttendeesScreen> createState() => _AttendeesScreenState();
}

class _AttendeesScreenState extends State<AttendeesScreen> {
  CollectionReference ref = FirebaseFirestore.instance.collection("attendence");

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 56, 171, 216),
          centerTitle: true,
          title: Text(
            "Attendees",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const Drawer(
          child: DrawerScreen(),
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: ref.where('event_id', isEqualTo: widget.takeId).get(),
              builder: (context, snapshot) {
                print(widget.takeId);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'There is no Attendee.',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (ctx, index) {
                          AttendeModel obj = AttendeModel.fromDocumentSnapshot(
                              doc: snapshot.data!.docs[index]);
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                title: const Text(
                                  "Name of Attendee",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "      ${obj.title}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 110, 110, 110),
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  "Event-ID",
                                  style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "      ${obj.event_id}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 110, 110, 110),
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                              const Divider(
                                indent: 20,
                                endIndent: 20,
                              ),
                            ],
                          );
                        });
                  }
                }
              }),
        ),
      ),
    );
  }
}
