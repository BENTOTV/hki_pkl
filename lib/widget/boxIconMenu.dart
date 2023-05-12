import 'package:flutter/material.dart';
import 'package:hki_app/widget/contanta.dart';


class BoxIconModul extends StatelessWidget {
  final String icon;
  const BoxIconModul({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: 
      // Container(
      //   width: 50,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     // border: Border.all(
      //     //   color: primaryColor,
      //     //   width: 2,
      //     // ),
      //     boxShadow: const [
      //       BoxShadow(
      //         color: primaryColor,
      //         offset: Offset(
      //           0.0,
      //           0.0,
      //         ),
      //         blurRadius: 1.0,
      //         spreadRadius: 0.1,
      //       ),
      //       BoxShadow(
      //         color: Colors.white,
      //         offset: Offset(0.0, 0.0),
      //         blurRadius: 0.0,
      //         spreadRadius: 0.0,
      //       ),
      //     ],
      //   ),
         Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(icon,
            height: 30,
            width: 30,
            color: kPrimaryColor,
           // color: kPrimaryColor,
          ),
        
      ),
    );
  }
}

