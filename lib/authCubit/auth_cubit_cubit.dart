import 'package:chat/widget/localtextfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class loginCubitCubit extends Cubit<authCubitState> {
  loginCubitCubit() : super(LoginCubitInitial());
 late String email;
void login({required String emaill,required String password}) async{
emit(LoginCubitwait());
  try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emaill, password: password);
                                    email=emaill;
                           emit(LoginCubitsuccsed(email: emaill, passward: password));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              emit(LoginCubitfaild(massage: 'No user found for that email.'));
                            } else if (e.code == 'wrong-password') {
                            emit(LoginCubitfaild(massage: 'Wrong password provided for that user.'));
                            }
                          }
}



}
class rigestercubit extends Cubit<authCubitState> {
  rigestercubit() : super(regsterCubitInitial());
 late String email;
void rigest({required String emaill,required String password}) async{
emit(regsterCubiloding());
  try {
                            var auth = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emaill, password: password);
                                    email=emaill;
                           emit(regsterCubitsuccsed());
                          }  on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                         emit(regsterCubifaild(massage: 'The password provided is too weak.'));
                        } else if (e.code == 'email-already-in-use') {
                          emit(regsterCubifaild(massage: 'The account already exists for that email. login!'));
                          
                        }
                      } catch (e) {
                           emit(regsterCubifaild(massage: 'ther was an error'));
                           debugPrint(e.toString());
                      }
}



}

