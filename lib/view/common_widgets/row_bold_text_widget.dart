import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:product_list_app/controller/constants/constant.dart';
import 'package:product_list_app/view/common_widgets/text_view_medium.dart';
import 'package:product_list_app/view/common_widgets/text_view_small.dart';

class RowBoldTextWidget extends StatelessWidget {
  String? title;
  String? value;
 bool? isNoPadding;
 Color? color;
 RowBoldTextWidget({required this.title,required this.value,this.isNoPadding,this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(isNoPadding!=true?4.0:0),
      child: Row(
       
        children: [
        TextViewSmall(title:'${title} : ',textcolor:color?? blackColor,),
        
        TextViewMedium(name: value,fontWeight: FontWeight.w700,textColors:color?? blackColor,fontSize: 12.sp,)
      ],),
    );
  }
}