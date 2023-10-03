import 'package:flutter/material.dart';


class localbutton extends StatelessWidget {
 localbutton ({required this.name ,required this.onTap});
String name;
Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                onTap:onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60), 
                    color: Colors.white, 
                  ),
                  height: 60,
                  width: double.infinity,
                  child:  Center(
                    child: Text("$name",
                        style:const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 44, 111, 219),
                        )),
                  ),
                ),
              );
  }
}