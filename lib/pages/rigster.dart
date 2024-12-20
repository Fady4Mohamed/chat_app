import 'dart:ui';

import 'package:chat/authCubit/auth_cubit_cubit.dart';
import 'package:chat/pages/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/ncostombutton.dart';
import '../widget/ncustomtextfield.dart';
import '../widget/textontap.dart';

class rigster extends StatefulWidget {
 const rigster({super.key});

  @override
  State<rigster> createState() => _rigsterState();
}

class _rigsterState extends State<rigster> {
  String? email, password;

  bool isLoding = false;

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
                    'assets/photo-1559494007-9f5847c49d94.jpeg',
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
                                      'RIGSTER',
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
                                    titel: 'you have an account',
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(height: size.width * .25),
                                  BlocConsumer<rigestercubit, authCubitState>(
                                    listener: (context, state) {
                                      if (state is regsterCubifaild) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(state.massage),
                                        ));
                                        isLoding = false;
                                      }
                                      if (state is regsterCubiloding) {
                                        isLoding = true;
                                      }
                                      if (state is regsterCubitsuccsed) {
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
                                        titel: 'rigster',
                                        onTap: () {
                                          if (email != null ||
                                              password != null) {
                                            BlocProvider.of<rigestercubit>(
                                                    context)
                                                .rigest(
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
