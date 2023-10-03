import 'package:chat/authCubit/auth_cubit_cubit.dart';
import 'package:chat/widget/localbutton.dart';
import 'package:chat/widget/localtextfeild.dart';
import 'package:chat/pages/chatpage.dart';
import 'package:chat/pages/rigster.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 

class loginpage extends StatelessWidget {
  loginpage({super.key});
  String? password, email;
   bool isLoding =false;
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
               const Row(
                  children:  [
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


                BlocConsumer<loginCubitCubit, authCubitState>(
                  listener: (context, state) {
                    if(state is LoginCubitfaild){
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                            content: Text(state.massage),
                          )); 
                          isLoding=false; 
                    }
                    if(state is LoginCubitwait){
                   isLoding=true;
                    }
                    if(state is LoginCubitsuccsed){
                      isLoding=false;
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return chatpage(email: email!,);
                        }));
                    }
                  },

                  builder: (context, state) {
                    return  GestureDetector(
                onTap:(){
               BlocProvider.of<loginCubitCubit>(context).login(emaill: email!, password: password!);

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60), 
                    color: Colors.white, 
                  ),
                  height: 60,
                  width: double.infinity,
                  child:  Center(
                    child: ModalProgressHUD(
                      inAsyncCall:isLoding ,
                      child:isLoding==false?const Text(  
                        "login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 44, 111, 219),
                          )):SizedBox(),
                    ),
                  ),
                ),
              );
                  },
                ),
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
