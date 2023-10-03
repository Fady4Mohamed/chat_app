import 'dart:ui';
import 'package:chat/authCubit/auth_cubit_cubit.dart';
import 'package:chat/pages/chatpage.dart';
import 'package:chat/pages/rigster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/ncostombutton.dart';
import '../widget/ncustomtextfield.dart';
import '../widget/textontap.dart';

class nloginpage extends StatefulWidget {
  @override
  _nloginpageState createState() => _nloginpageState();
}

String? password, email;
bool isLoding = false;

class _nloginpageState extends State<nloginpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/drag.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .15,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                  component(
                                    icon: Icons.email_outlined,
                                    hintText: 'Email...',
                                    onchanged: (p0) {
                                      email = p0;
                                    },
                                  ),
                                  component(
                                    icon: Icons.lock_outline,
                                    hintText: 'Password...',
                                    isPassword: true,
                                    onchanged: (p0) {
                                      password = p0;
                                    },
                                  ),
                                  textontap(
                                    titel: 'create a new Account',
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return rigster();
                                      }));
                                    },
                                  ),
                                  SizedBox(height: size.width * .25),
                                  BlocConsumer<loginCubitCubit, authCubitState>(
                                    listener: (context, state) {
                                      if (state is LoginCubitfaild) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(state.massage),
                                        ));
                                        isLoding = false;
                                      }
                                      if (state is LoginCubitwait) {
                                        isLoding = true;
                                      }
                                      if (state is LoginCubitsuccsed) {
                                        isLoding = false;
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return chatpage(
                                            email: email!,
                                          );
                                        }));
                                      }
                                    },
                                    builder: (context, state) {
                                      return ncustombutton(
                                        contain: isLoding
                                            ? CircularProgressIndicator()
                                            : null,
                                        titel: 'sing-in',
                                        onTap: () {
                                          if (email != null ||
                                              password != null) {
                                            BlocProvider.of<loginCubitCubit>(
                                                    context)
                                                .login(
                                                    emaill: email!,
                                                    password: password!);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
