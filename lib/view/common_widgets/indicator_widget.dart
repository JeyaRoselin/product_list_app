import 'package:flutter/material.dart';
import 'package:product_list_app/controller/constants/constant.dart';


class CircularWidgetC extends StatelessWidget {
  Color? color;
   CircularWidgetC({this.color});

  @override
  Widget build(BuildContext context) {
    return  Center(child:CircularProgressIndicator(color:color?? appColor,));
  }
}
class CircularWidgetS extends StatelessWidget {
  const CircularWidgetS({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appBackColor,
      body: Center(child:CircularProgressIndicator(color: appColor,)) ,
    );
  }
}

