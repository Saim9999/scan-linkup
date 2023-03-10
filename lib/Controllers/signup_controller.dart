import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:scanner_linkup_app/Models/ui_helper.dart';
import 'package:scanner_linkup_app/Screens/signup_screen.dart';


class SignUpController extends GetxController
{
  CollectionReference signUser= FirebaseFirestore.instance.collection('sign users');
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
  // Rx<String>radiobutton = ''.obs;
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
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? currentUser = credential.user;
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
        };
        signUser.add(profileData);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        UIHelper.showAlertDialog(Get.context!, "Error", "content");
      }
    } catch (e) {
      print(e);
    }
  }
}