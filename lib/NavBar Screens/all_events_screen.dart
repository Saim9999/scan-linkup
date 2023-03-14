import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Models/event_model.dart';
import '../Screens/drawer_screen.dart';
import 'event_details-screen.dart';

class AllEvents extends StatefulWidget {
  String? event_id;
  AllEvents({super.key, this.event_id,});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  ///////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  CollectionReference eventRef =
      FirebaseFirestore.instance.collection("events");
  String? countryValue = "Select a Specific Country";
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  Widget build(BuildContext context) {
    id = user!.uid;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: const Color.fromARGB(255, 56, 171, 216),
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Event Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // drawer: const Drawer(
        //   child: DrawerScreen(),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder(
                future: eventRef
                    .where('event_id', isEqualTo: widget.event_id)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print(widget.event_id);
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
                          'No event to show.',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              EventModel obj = EventModel.fromDocumentSnapshot(
                                  doc: snapshot.data!.docs[index]);
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      obj.country,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Get.to(EventDetailScreen(
                                        title: obj.title,
                                        subtitle: obj.description,
                                        image: obj.image_object,
                                        takeId: obj.event_id,
                                      ));
                                    },
                                    tileColor: Colors.grey.withOpacity(0.2),
                                    leading: SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: Image.network(
                                        obj.image_object,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      obj.title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    subtitle: Text(
                                      obj.description,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 110, 110, 110),
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  )
                                ],
                              );
                            }),
                      );
                    }
                  }
                }),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
