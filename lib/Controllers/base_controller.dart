import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BaseController extends GetxController {
  void alert1(String alert) {
    Fluttertoast.showToast(
      msg: alert,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.indigo,
    );
  }
}