import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  static CollectionReference userReference = FirebaseFirestore.instance.collection("sign user");
  // ignore: unused_element
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    bool status = false;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password).then((
          value) {
        Get.snackbar("Successfully!", "You are logged in.",
            backgroundColor: Colors.purpleAccent,
            showProgressIndicator: true,
            icon: const Icon(Icons.error, color: Colors.red,),
            backgroundGradient: const LinearGradient(colors: [
              Colors.blueAccent,
              Colors.blue,
            ]));
      });
      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return status;
  }
  ////////////////////////////
  String? emailValidation(String? value)
  {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!))
    {
      return 'Please enter a valid email address';
    }
    return null;
  }
  ////////////////////////////
  String? val(String? value)
  {
    if (value == null || value.isEmpty) {
      return "Field Can't be Empty!";
    }
    return null;
  }
  ///////////////////////////
  GlobalKey<FormState> globalKey = GlobalKey();

}