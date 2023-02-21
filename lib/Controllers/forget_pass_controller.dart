// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class ForgetPassController extends GetxController
// {
//   /////////////////////////////////
//   TextEditingController resetEmailController = TextEditingController();
//   bool isInAsyncCall = false;
//   final formKey = GlobalKey<FormState>();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   /////////////////////////////////
//   void alert1(String alert)
//   {
//     Fluttertoast.showToast(
//       msg: alert,
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.CENTER,
//       backgroundColor: Colors.indigo,
//     );
//   }
//   ///////////////////////////////////////////
//   String? emailValidation(String? value)
//   {
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value!))
//     {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

// }