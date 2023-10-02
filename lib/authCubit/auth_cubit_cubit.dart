import 'package:chat/model/localtextfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
