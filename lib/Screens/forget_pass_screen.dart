import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scanner_linkup_app/Controllers/base_controller.dart';
import 'package:scanner_linkup_app/Screens/scanner_login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override

  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController resetemailController = new TextEditingController();
  BaseController baseController = Get.put(BaseController());

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _sendPasswordResetLink() async {
    await _firebaseAuth
        .sendPasswordResetEmail(email: resetemailController.text.trim())
        .then((result) {
      setState(() {
      });
      baseController.alert1(
          'Password reset link has been successfully sent to your inbox!');
    }).catchError((error) {
      setState(() {
      });
      print(error.toString());
    });
  }

  @override
  void dispose() {
    resetemailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/Group 10 (1).png',
                ),
                fit: BoxFit.fill),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                width: width * 0.95,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 80.h,
                        ),
                        Center(
                            child: Image.asset(
                          'assets/images/Vector Smart Object (1).png',
                          height: 100,
                        )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        TextFormField(
                          controller: resetemailController,
                          decoration: InputDecoration(
                            hintText: '   ------'.tr,
                            contentPadding: EdgeInsets.only(
                                left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Please enter email'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You will receive new pass'.tr,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff38ABD8),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: width / 1.3,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _sendPasswordResetLink();
                                    setState(() {
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff38ABD8),
                                ),
                                child: Text(
                                  'Send Email'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Already have an account?".tr,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return EmailLoginScreen();
                                }));
                              },
                              child: Text(
                                'Log in'.tr,
                                style: TextStyle(
                                  color: Color(0xff38ABD8),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}