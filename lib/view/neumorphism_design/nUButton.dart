import 'package:flutter/material.dart';
import 'package:otp_provider/view/neumorphism_design/neumorphism_container.dart';

class NMButton extends StatelessWidget {
  String?text;
  IconData? icon;
  double?height;
  double?width;

   NMButton({this.icon,this.text,this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:  height,
      decoration: nMbox,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //   Icon(
        //  icon !=null?  icon:null,
        //     color: fCL,
        //   ),
          Center(child: Text(text.toString()))
        ],
      ),
    );
  }
}