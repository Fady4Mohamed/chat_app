part of 'auth_cubit_cubit.dart';

@immutable
abstract class authCubitState {}

class LoginCubitInitial extends authCubitState {}

class LoginCubitfaild extends authCubitState {
   LoginCubitfaild({required  this.massage});
  final String massage;
  
}

class LoginCubitwait extends authCubitState {}

class LoginCubitsuccsed extends authCubitState {
  LoginCubitsuccsed({required  this.email,required this.passward});
  String email;
  String passward;
}

class regsterCubitInitial extends authCubitState {}

class regsterCubifaild extends authCubitState {
   final String massage;

  regsterCubifaild({required this.massage});
}
class regsterCubiloding extends authCubitState {}


class regsterCubitsuccsed extends authCubitState {}