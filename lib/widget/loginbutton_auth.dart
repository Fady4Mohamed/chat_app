
import 'package:chat/authCubit/auth_cubit_cubit.dart';
import 'package:chat/widget/ncostombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/chatpage.dart';

class loginbutton_auth extends StatefulWidget {
 const  loginbutton_auth({
    super.key,  this.email,  this.password,
  });
final String? email,password;
  @override
  State<loginbutton_auth> createState() => _loginbutton_authState();
}

class _loginbutton_authState extends State<loginbutton_auth> {
 bool isLoding=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<loginCubitCubit, authCubitState>(
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
              email: widget.email!,
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

            if (widget.email != null ||
                widget.password != null) {
              BlocProvider.of<loginCubitCubit>(
                      context)
                  .login(
                      emaill:widget.email!,
                      password: widget.password!);
            }
           
          },
        );
      },
    );
  }
}