import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Models/event_model.dart';
import '../Screens/drawer_screen.dart';
import 'event_details-screen.dart';

class SearchEvents extends StatefulWidget {
  const SearchEvents({super.key});

  @override
  State<SearchEvents> createState() => _SearchEventsState();
}

class _SearchEventsState extends State<SearchEvents> {
  CollectionReference eventRef =
  FirebaseFirestore.instance.collection("events");
  String? countryValue = "Select a Specific Country";
  User? user = FirebaseAuth.instance.currentUser;
  String? id;
  @override
  Widget build(BuildContext context) {
    id=user!.uid;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: const Color.fromARGB(255, 56, 171, 216),
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Events",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        drawer: const Drawer(child: DrawerScreen()),
        body: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: CSCPicker(
                    showCities: false,
                    showStates: false,
                    flagState: CountryFlag.DISABLE,
                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        )),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border:
                        Border.all(color: Colors.grey.shade300, width: 1)),
                    selectedItemStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    dropdownHeadingStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    dropdownItemStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    dropdownDialogRadius: 10.0,
                    searchBarRadius: 10.0,
                    countrySearchPlaceholder: "Country",
                    countryDropdownLabel: "Country",
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'See You Events in Other Countries',
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Selected Country",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$countryValue",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 110, 110, 110),
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder(
                future:
                eventRef.where('country', isEqualTo: countryValue).where('id',isEqualTo: id).get(),
                builder: (context, snapshot) {

                  if (snapshot.connectionState == ConnectionState.waiting)
                  {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null)
                  {
                    return const Center(child: Text(
                      'No data found', style: TextStyle(color: Colors.black),));
                  }
                  else
                  {
                    if (snapshot.data!.docs.isEmpty)
                    {
                      return const Text(
                        'There is no Record against selected country.',
                        style: TextStyle(color: Colors.black),
                      );
                    }
                    else {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              EventModel obj = EventModel.fromDocumentSnapshot(doc: snapshot.data!.docs[index]);
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: (){
                                      Get.to(
                                          EventDetailScreen(title: obj.title,subtitle:obj.description ,image: obj.image_object,takeId: obj.event_id,)
                                      );
                                    },
                                    tileColor:Colors.grey.withOpacity(0.2),
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
                                        color: Color.fromARGB(255, 110, 110, 110),
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    trailing: Text(obj.event_id,style: const TextStyle(color: Colors.transparent,fontSize: 1),),
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
              height: 45.h,
            )
          ],
        ),
      ),
    );
  }
}
