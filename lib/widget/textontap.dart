import 'package:flutter/material.dart';

class textontap extends StatelessWidget {
  const textontap({
    super.key, required this.titel, this.onTap,
  });
 final String titel;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround,
      children: [ 
       GestureDetector(child: Text(titel,
       style: TextStyle(color: Colors.white),
       ),
       onTap: onTap,
       ),
      ],
    );
  }
}
