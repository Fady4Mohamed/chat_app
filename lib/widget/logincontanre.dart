
import 'dart:ui';

import 'package:chat/widget/googelconfirm.dart';
import 'package:chat/widget/loginbutton_auth.dart';
import 'package:chat/widget/ncustomtextfield.dart';
import 'package:chat/widget/textontap.dart';
import 'package:flutter/material.dart';

import '../pages/rigster.dart';

class logincontaner extends StatefulWidget {
  const logincontaner({
    super.key
  });

  @override
  State<logincontaner> createState() => _logincontanerState();
}
String? password, email;
bool isLoding = false;
class _logincontanerState extends State<logincontaner> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Center(
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
                filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
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
                      googelconfirm(),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                      loginbutton_auth(
                          email: email, password: password),
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
    );
  }
}