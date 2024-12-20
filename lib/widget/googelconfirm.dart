import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/chatpage.dart';

class googelconfirm extends StatelessWidget {
  const googelconfirm({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        print('============1==========');
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          print('=======2===============');
          // Obtain the auth details from the request
          if (googleUser != null) {
            final GoogleSignInAuthentication googleAuth =
                await googleUser.authentication;
                  print('============3===========');
            // Create a new credential
            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
                    print('============4===========');
            // Once signed in, return the UserCredential
            await FirebaseAuth.instance.signInWithCredential(credential);
                    print('hhhhhhhhhhhi');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return chatpage(
                email: 'yvuv',
              );
            }));
                   print('===========6============');
          } },
      child: Container(
        height: size.height / 9,
        width: size.height / 7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset('assets/google-logo-9808.png',
            height: size.height / 9 - 16),
      ),
    );
  }
}
Future signInWithGoogle(context) async {
          // Trigger the authentication flow
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          // Obtain the auth details from the request
          if (googleUser != null) {
            final GoogleSignInAuthentication? googleAuth =
                await googleUser.authentication;

            // Create a new credential
            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken,
            );

            // Once signed in, return the UserCredential
            await FirebaseAuth.instance.signInWithCredential(credential);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return chatpage(
                email: googleUser.email,
              );
            }));
           
          }
        }