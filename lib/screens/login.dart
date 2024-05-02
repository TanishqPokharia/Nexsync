import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/auth/auth_services.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:prognosify/auth/auth_services.dart';
// import 'package:prognosify/auth/google_sign_in.dart';
// import 'package:prognosify/router/app_router_constants.dart';
// import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key, required this.isHR});
  final bool isHR;

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKeySignIn = GlobalKey<FormState>();
  bool _passwordHideStatus = true;
  String email = "";
  String password = "";
  bool waiting = false;

  double mq(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * (size / 1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        body: Stack(
          children: [
            Form(
              key: _formKeySignIn,
              child: Container(
                padding: EdgeInsets.all(mq(context, 15)),
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
                          key: const ValueKey("emailSignIn"),
                          validator: (value) {
                            if (value!.length < 5) {
                              return "Not a valid email";
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
                                style: TextStyle(fontSize: mq(context, 25)),
                                // style: TextStyle(fontSize: 20),
                              )),
                        )),
                    SizedBox(
                      height: mq(context, 55),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: mq(context, 45)),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: mq(context, 21), color: Colors.white),
                        key: const ValueKey("passwordSignIn"),
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
                              style: TextStyle(fontSize: mq(context, 25)),
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 10, left: 20, right: 20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: mq(context, 65)),
                            height: mq(context, 65),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 46, 45, 45)),
                            child: Shimmer(
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Colors.yellow,
                                Colors.pink,
                                Colors.blue,
                                Colors.cyan
                              ]),
                              child: TextButton(
                                  onPressed: () async {
                                    if (_formKeySignIn.currentState!
                                        .validate()) {
                                      _formKeySignIn.currentState!.save();
                                      await AuthServices.logInHR(
                                          email, password);

                                      if (context.mounted) {
                                        if (widget.isHR) {
                                          GoRouter.of(context).goNamed(
                                              AppRouterConstants
                                                  .landingScreenHR);
                                        } else {
                                          GoRouter.of(context).goNamed(
                                              AppRouterConstants
                                                  .landingScreenEmployee);
                                        }
                                      }
                                    }
                                  },
                                  child: Text("Log In",
                                      style: TextStyle(
                                          fontSize: mq(context, 28)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            waiting
                ? const Center(child: CircularProgressIndicator())
                : Container(),
          ],
        ));
  }
}
