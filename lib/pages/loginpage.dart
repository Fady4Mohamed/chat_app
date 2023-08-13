import 'package:chat/model/localbutton.dart';
import 'package:chat/model/localtextfeild.dart';
import 'package:chat/pages/chatpage.dart';
import 'package:chat/pages/rigster.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  loginpage({super.key});
  String? password, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 219, 204, 4),
              Color.fromARGB(255, 219, 204, 4),
              Color.fromARGB(255, 81, 175, 246)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(children: [
          Image.asset(
            'assets/pngegg.png',
            height: 280,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 44, 111, 219),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                localtextfeild(
                    hint: "  E-mail",
                    onChanged: (data) {
                      email = data;
                    }),
                const SizedBox(height: 12),
                localtextfeild(
                    hint: "  passward",
                    onChanged: (data) {
                      password = data;
                    }),
                    
                const SizedBox(height: 12),
                localbutton(
                    name: "login",
                    onTap: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email!, password: password!);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return chatpage(email: email!,);
                        }));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    }),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have an account "),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return rigster();
                          }));
                        },
                        child: const Text(
                          "rigster",
                          style: TextStyle(
                              color: Color.fromARGB(255, 44, 111, 219)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
