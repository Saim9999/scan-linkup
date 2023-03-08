import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:scanner_linkup_app/Controllers/login_controller.dart';
import 'package:scanner_linkup_app/Screens/signup_screen.dart';
import '../NavBar Screens/mian_navbar_screen.dart';
import 'forget_pass_screen.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
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

  // GlobalKey<FormState> globalKey = GlobalKey();
  bool _obscureText = true;

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
                image: AssetImage('assets/images/Link Up Scanner  Login 1.png'),
                fit: BoxFit.fill),
          ),
          child: GetBuilder<LoginScreenController>(
              init: LoginScreenController(),
              builder: (logic) {
                return GetBuilder<LoginScreenController>(
                    init: LoginScreenController(),
                    builder: (c) {
                      return ListView(
                        children: [
                          SizedBox(
                            height: 70.h,
                          ),
                          Center(
                              child: Image.asset(
                            'assets/images/Vector Smart Object (5).png',
                            height: 80.h,
                          )),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                              height: 360.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Hello',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: largetext(
                                        'Login into your account to check attendees in'),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  const Divider(
                                    endIndent: 15,
                                    indent: 15,
                                    color: Color.fromARGB(255, 56, 170, 215),
                                    thickness: 1,
                                  ),
                                  Form(
                                    key: c.globalKey,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          largetext('Email'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: TextFormField(
                                              validator: c.emailValidation,
                                              controller: c.emailController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  hintText: "email@gmail.com.",
                                                  hintStyle: TextStyle(
                                                      fontSize: 10.sp)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          largetext('Password'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: TextFormField(
                                              obscureText: _obscureText,
                                              validator: c.val,
                                              controller: c.passController,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                // contentPadding:
                                                //     const EdgeInsets.only(
                                                //         left: 15),
                                                hintText: "***************",
                                                hintStyle:
                                                    TextStyle(fontSize: 10.sp),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _obscureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                        color: Color.fromARGB(
                                                      255, 56, 170, 215),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _obscureText =
                                                          !_obscureText;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (_) {
                                                return const ForgetPasswordScreen();
                                              }));
                                            },
                                            child: const Text(
                                              'Forgot your password',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 56, 170, 215)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      height: 30.h,
                                      width: 310.w,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 56, 170, 215),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: TextButton(
                                          onPressed: () async {
                                            if (c.globalKey.currentState!
                                                .validate()) {
                                              {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                      child: spinkit,
                                                    );
                                                  },
                                                  barrierDismissible: false,
                                                );
                                                bool status = await c.loginUser(
                                                    email:
                                                        c.emailController.text,
                                                    password:
                                                        c.passController.text);
                                                FocusScope.of(context)
                                                    .unfocus();
                                                if (status) {
                                                  Get.offAll(
                                                      const NavigationScreen());
                                                } else {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                  Get.defaultDialog(
                                                    title: "Error",
                                                    middleText:
                                                        "Wrong Email or Password Provided.",
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 56, 170, 215),
                                                  );
                                                }
                                              }
                                            }
                                          },
                                          child: const Center(
                                              child: Text(
                                            'LOGIN',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Don't have an acoount?",
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (_) {
                                              return const LinkupSignUpScreen();
                                            }));
                                          },
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 56, 170, 215),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }),
        )),
      ),
    );
  }

  Text largetext(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
