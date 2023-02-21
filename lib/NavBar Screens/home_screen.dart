import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_linkup_app/Models/event_model.dart';
import 'package:scanner_linkup_app/Screens/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference eventRef =
      FirebaseFirestore.instance.collection("events");
  String? countryValue = "Select a Specific Country";

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: const Color.fromARGB(255, 56, 171, 216),
          elevation: 0.0,
          title: Text(
            "Events",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        'Search',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'See You Events in Other Countries',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CSCPicker(
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
                    eventRef.where('country', isEqualTo: countryValue).get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) {
                            EventModel obj = EventModel.fromDocumentSnapshot(
                                doc: snapshot.data!.docs[index]);
                            return Column(
                              children: [
                                ListTile(
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
                                      fontWeight: FontWeight.bold,
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
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            );
                          }),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            SizedBox(
              height: 45.h,
            ),
          ],
        ),
      ),
    );
  }
}
