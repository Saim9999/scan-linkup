import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scanner_linkup_app/Screens/scanner_login_screen.dart';

import '../Models/ui_helper.dart';

class LinkupSignUpScreen extends StatefulWidget {
  const LinkupSignUpScreen({super.key});
  @override
  State<LinkupSignUpScreen> createState() => _LinkupSignUpScreenState();
}

class _LinkupSignUpScreenState extends State<LinkupSignUpScreen> {
  ///////////////////////////////////////////////
  // late int selectedRadioTile;
  CollectionReference signUser =
      FirebaseFirestore.instance.collection('scansignUsers');
  /////////////////////////////////////////////
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressscanController = TextEditingController();
  TextEditingController telefonescanController = TextEditingController();
  TextEditingController emailscanController = TextEditingController();
  // TextEditingController websiteController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController passController = TextEditingController();
  /////////////////////////////////////
  ///
  // Rx<String> radiobutton = ''.obs;
  // Location location = Location.Yes;
  
  ///////////////////////////////////
  Future sendData(
    String firstName,
    String lastName,
    String address,
    String telephone,
    String email,
    String password,
    // String website,
    // String radio,
    String role,
  ) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        Navigator.of(context).pop();
        UIHelper.showAlertDialog(context, "An error occured!",
            "The account already exists for that email.");
      }
    }
    User? currentUser = credential!.user;
    if (currentUser != null) {
      debugPrint(currentUser.uid);
      Map<String, dynamic> profileData = {
        "uid": currentUser.uid,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "telephone": telephone,
        "email": email,
        // "website": website,
        // "radio": radiobutton.value,
        "role": role,
        "created_at": DateTime.now(),
      };
      signUser.add(profileData);
    }
  }

  String? val(String? value) {
    if (value == null || value.isEmpty) {
      return "Field Can't be Empty!";
    }
    return null;
  }

  GlobalKey<FormState> globalKey = GlobalKey();

  final List<String> items = [
    "Organizer",
    "Scanner",
  ];
  String? selectedValue;

  final spinkit = SpinKitFadingCircle(
    size: 50,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white : Colors.blueAccent,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) => Scaffold(
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Group 10 (1).png'),
                  fit: BoxFit.fill)),
          child: ListView(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Center(
                child: Text(
                  'Welcome to',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
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
              SizedBox(
                height: 15.h,
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, left: 25),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          largeText('First Name'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              validator: val,
                              controller: firstnameController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: "Enter",
                                  hintStyle: TextStyle(fontSize: 10.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          largeText('Last Name'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              validator: val,
                              controller: lastnameController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: "Enter",
                                  hintStyle: TextStyle(fontSize: 10.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          largeText('Address'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              validator: val,
                              controller: addressscanController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: "Enter",
                                  hintStyle: TextStyle(fontSize: 10.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          largeText('Telephone'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              validator: val,
                              controller: telefonescanController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: "Enter",
                                  hintStyle: TextStyle(fontSize: 10.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          largeText('Email'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              validator: (value) {
                                // Regular expression for email validation
                                final emailRegex =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(value!)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              controller: emailscanController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: "Enter",
                                  hintStyle: TextStyle(fontSize: 10.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          largeText('Password'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a password';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                } else if (!RegExp(r'[a-zA-Z]')
                                    .hasMatch(value)) {
                                  return 'Password must contain at least one letter';
                                } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return 'Password must contain at least one number';
                                }
                                return null; // Return null if the validation passes
                              },
                              controller: passController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 15),
                                hintText: "Password",
                                hintStyle: TextStyle(fontSize: 10.sp),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          // largeText('Website'),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 15),
                          //   child: TextFormField(
                          //     validator: val,
                          //     controller: websiteController,
                          //     textInputAction: TextInputAction.next,
                          //     decoration: InputDecoration(
                          //         contentPadding:
                          //             const EdgeInsets.only(left: 15),
                          //         hintText: "Enter",
                          //         hintStyle: TextStyle(fontSize: 10.sp)),
                          //   ),
                          // ),
                          SizedBox(
                            height: 15.h,
                          ),
                          // largeText('www'),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Row(
                          //         children: [
                          //           Radio(
                          //               value: Location.Yes,
                          //               groupValue: location,
                          //               onChanged: (value) {
                          //                 setState(() {
                          //                   location = value!;
                          //                   radiobutton.value = "Organization";
                          //                 });
                          //               }),
                          //           const Text('Organization')
                          //         ],
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Row(
                          //         children: [
                          //           Radio(
                          //               value: Location.No,
                          //               groupValue: location,
                          //               onChanged: (value) {
                          //                 setState(() {
                          //                   location = value!;
                          //                   radiobutton.value = "Individual";
                          //                 });
                          //               }),
                          //           const Text('Individual')
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          largeText('Role'),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    underline: Container(),
                                    isExpanded: true,
                                    hint: const Text(
                                      "Select",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromARGB(255, 110, 110, 110),
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                    ),
                                    value: selectedValue,
                                    items: items.map((String item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: const Color.fromARGB(
                                                255, 110, 110, 110),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                        roleController.text = newValue;
                                      });
                                    },
                                  ),
                                  // child: TextFormField(
                                  //   validator: val,
                                  //   controller: roleController,
                                  //   textInputAction: TextInputAction.done,
                                  //   decoration: InputDecoration(
                                  //       contentPadding:
                                  //       const EdgeInsets.only(left: 15),
                                  //       hintText: "Event Organizer",
                                  //       hintStyle: TextStyle(fontSize: 10.sp)),
                                  // ),
                                ),
                                // const Expanded(
                                //     child: Icon(
                                //       Icons.arrow_drop_down,
                                //       color: Color.fromARGB(255, 56, 170, 215),
                                //     ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Center(
                child: Container(
                  height: 30.h,
                  width: 310.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 56, 170, 215),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextButton(
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: spinkit,
                              );
                            },
                            barrierDismissible: false,
                          );
                          await sendData(
                            firstnameController.text,
                            lastnameController.text,
                            addressscanController.text,
                            telefonescanController.text,
                            emailscanController.text,
                            passController.text,
                            // websiteController.text,
                            // radiobutton.value,
                            roleController.text,
                          );
                          Fluttertoast.showToast(
                              msg: "Sign up Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Get.offAll(const EmailLoginScreen());
                        }
                      },
                      child: const Center(
                          child: Text(
                        'SUBMIT',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.offAll(const EmailLoginScreen());
                        },
                        child: const Text('Login')),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        )),
      ),
    );
  }

  Text largeText(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}

// enum Location { Yes, No }
