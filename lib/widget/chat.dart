import 'package:chat/model/message.dart';
import 'package:flutter/material.dart';


class localchatMe extends StatefulWidget {
   localchatMe({required this.message,required this.data});
Messages message;
String data;
String screenshow="";
double bading = 1;

  @override
  State<localchatMe> createState() => _localchatMeState();
}

class _localchatMeState extends State<localchatMe> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () {
           widget.screenshow=widget.data;
            widget.bading=5;
      setState(() {
      });
        },
        onTap: (){
      widget.screenshow="";
       widget.bading=0;
      setState(() { 
      });
        },
        child: Container(
            margin:  EdgeInsets.only(bottom: widget.bading,left: 8,right: 40,top: 5),
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
                Text(widget.screenshow,style:const TextStyle(fontSize: 11),) 
            ],
          ),
        ),
      ),
    );
  }
}

class localchatHe extends StatefulWidget {
   localchatHe({required this.message,required this.data});
Messages message;
String data;
String screenshow="";
double bading = 1;


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
           widget.screenshow=widget.data;
            widget.bading=5;
      setState(() {
      });
        },
        onTap: (){
      widget.screenshow="";
       widget.bading=0;
      setState(() { 
      });
        },
        child: Container(
            margin:  EdgeInsets.only(bottom: widget.bading,left: 40,right: 8,top: 5),
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
                Text(widget.screenshow,style:const TextStyle(fontSize: 11),) 
            ],
          ),
        ),
      ),
    );
  }
}
