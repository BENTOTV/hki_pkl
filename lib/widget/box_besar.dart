
import 'package:flutter/material.dart';


class Boxbesar extends StatelessWidget {
  const Boxbesar({super.key,required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
   double widthh = MediaQuery.of(context).size.width;
    return Padding(
       padding: EdgeInsets.only(left: widthh*16/360,right: widthh*16/360,),
      child: Card(
        elevation: 1,
       // margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side:  BorderSide(
            width: 0.5,
            color: Colors.black

          )
        ),
        
        child: child
          
        
      ),
    );
  }
}