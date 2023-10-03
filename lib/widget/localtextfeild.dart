import 'package:flutter/material.dart';

class localtextfeild extends StatelessWidget {
  localtextfeild({ this.hint,this.onChanged});
String? hint;
bool flage =false;

Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
if(hint=='  passward'){ flage=true;}
    return TextField(
      obscureText: flage,
                  onChanged: onChanged,
                cursorColor:const Color.fromARGB(255, 44, 111, 219),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),),
                  
                  hintText: '$hint',
                  hintStyle:const
                      TextStyle(color: Color.fromARGB(255, 44, 111, 219)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(60) ,
                    borderSide:const BorderSide(
                        width: 2, color: Color.fromARGB(255, 44, 111, 219)),
                  ),
                ),
              );
  }
}