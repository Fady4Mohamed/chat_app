import 'package:chat/model/localbutton.dart';
import 'package:chat/pages/chatpage.dart';
import 'package:flutter/material.dart';
import '../model/localtextfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';

class rigster extends StatelessWidget {
  rigster({super.key});
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 204, 4),
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
          Image.asset('assets/pngegg.png', height: 280),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'RIGSTER',
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
                  },
                ),
                const SizedBox(height: 12),
                localtextfeild(
                    hint: "  password",
                    onChanged: (data) {
                      password = data;
                    }),
                const SizedBox(height: 12),
                localbutton(
                    name: 'rigster',
                    onTap: () async {
                      try {
                        var auth = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email!, password: password!);
                             Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return chatpage(email: email!,);
                        }));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('The password provided is too weak.'),
                          ));
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'The account already exists for that email. login!'),
                          ));
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$e"),
                        ));
                      }
                    }),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("have an account "),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "login",
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
