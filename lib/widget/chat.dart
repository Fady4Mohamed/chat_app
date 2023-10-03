import 'package:chat/model/message.dart';
import 'package:flutter/material.dart';


class localchatMe extends StatefulWidget {
const   localchatMe({required this.message,required this.data});
final Messages message;
final String data;

  @override
  State<localchatMe> createState() => _localchatMeState();
}
String screenshow="";
double bading = 1;

class _localchatMeState extends State<localchatMe> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () {
           screenshow=widget.data;
            bading=5;
      setState(() {
      });
        },
        onTap: (){
      screenshow="";
       bading=0;
      setState(() { 
      });
        },
        child: Container(
            margin:  EdgeInsets.only(bottom:bading,left: 8,right: 40,top: 5),
          child: Column(
            children: [
              Container(
                
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                           color:  Color.fromARGB(255, 59, 89, 142),
                          ),
                 
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(widget.message.message,style: const TextStyle(color: Color.fromARGB(255, 229, 227, 227)),),
                  ),
                ),
                Text(screenshow,style:const TextStyle(fontSize: 11),) 
            ],
          ),
        ),
      ),
    );
  }
}

class localchatHe extends StatefulWidget {
  const localchatHe({required this.message,required this.data});
final Messages message;
final String data;


  @override
  State<localchatHe> createState() => _localchatHeState();
}


class _localchatHeState extends State<localchatHe> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onLongPress: () {
           screenshow=widget.data;
            bading=5;
      setState(() {
      });
        },
        onTap: (){
      screenshow="";
       bading=0;
      setState(() { 
      });
        },
        child: Container(
            margin:  EdgeInsets.only(bottom: bading,left: 40,right: 8,top: 5),
          child: Column(
            children: [
              Container(
                
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                           color:  Color.fromARGB(255, 107, 145, 226),
                          ),
                 
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(widget.message.message,style: const TextStyle(color: Color.fromARGB(255, 229, 227, 227)),),
                  ),
                ),
                Text(screenshow,style:const TextStyle(fontSize: 11),) 
            ],
          ),
        ),
      ),
    );
  }
}
