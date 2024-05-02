import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/auth/auth_services.dart';
import 'package:nexsync/main_page/hr_landing_page.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:shimmer/shimmer.dart';

// import 'package:prognosify/auth/auth_services.dart';
// import 'package:prognosify/router/app_router_constants.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKeySignUp = GlobalKey<FormState>();

  bool _passwordHideStatus = true;
  String fullName = "";
  String email = "";
  String password = "";

  double mq(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * (size / 1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        body: Form(
          key: _formKeySignUp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Hero(
                  tag: "Tag",
                  child: Image.asset(
                    "assets/nex.png",
                    width: mq(context, 350),
                    height: mq(context, 250),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: mq(context, 55),
                      right: mq(context, 45),
                      left: mq(context, 45)),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: mq(context, 21), color: Colors.white),
                    key: const ValueKey("emailSignUp"),
                    validator: (value) {
                      if (value!.length < 5 ||
                          value.isEmpty ||
                          !value.contains("@") &&
                              !value.contains(".`") &&
                              !value.contains("com")) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        email = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(mq(context, 10)))),
                        label: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: mq(context, 25), color: Colors.white),
                          // style: TextStyle(fontSize: 20),
                        )),
                  )),
              SizedBox(
                height: mq(context, 55),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: mq(context, 45)),
              //   child: TextFormField(
              //     style:
              //         TextStyle(fontSize: mq(context, 21), color: Colors.white),
              //     key: const ValueKey("Fullname"),
              //     validator: (value) {
              //       if (!value!.contains(" ")) {
              //         return "Please enter your full name";
              //       } else {
              //         return null;
              //       }
              //     },
              //     onSaved: (newValue) {
              //       setState(() {
              //         fullName = newValue!;
              //       });
              //     },
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius:
              //               BorderRadius.all(Radius.circular(mq(context, 10)))),
              //       label: Text(
              //         "Full Name",
              //         style: TextStyle(
              //             fontSize: mq(context, 25), color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: mq(context, 55),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: mq(context, 45)),
                child: TextFormField(
                  style:
                      TextStyle(fontSize: mq(context, 21), color: Colors.white),
                  key: const ValueKey("passwordSignUp"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please create a strong password";
                    }

                    // Check length
                    if (value.length < 8) {
                      return "Password should be at least 8 characters long";
                    }

                    // Check for uppercase letters
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return "Password should contain at least one uppercase letter";
                    }

                    // Check for lowercase letters
                    if (!value.contains(RegExp(r'[a-z]'))) {
                      return "Password should contain at least one lowercase letter";
                    }

                    // Check for numbers
                    if (!value.contains(RegExp(r'[0-9]'))) {
                      return "Password should contain at least one number";
                    }

                    // Check for special characters
                    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return "Password should contain at least one special character";
                    } else
                      return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      password = newValue!;
                    });
                  },
                  obscureText: _passwordHideStatus,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(mq(context, 10)))),
                      label: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: mq(context, 25), color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_passwordHideStatus
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passwordHideStatus = !_passwordHideStatus;
                          });
                        },
                      )),
                ),
              ),
              Container(padding: EdgeInsets.only(top: mq(context, 45))),
              Container(
                margin: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                height: mq(context, 65),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 46, 45, 45)),
                width: double.infinity,
                child: TextButton(
                    onPressed: () async {
                      if (_formKeySignUp.currentState!.validate()) {
                        _formKeySignUp.currentState!.save();
                        AuthServices.signUpHR(email, password);
                        GoRouter.of(context)
                            .goNamed(AppRouterConstants.landingScreenHR);
                      }
                    },
                    child: Shimmer(
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.yellow,
                        Colors.pink,
                        Colors.blue,
                        Colors.cyan
                      ]),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: mq(context, 28), color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
