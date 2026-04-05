import 'dart:io';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';


import 'package:product_list_app/controller/constants/constant.dart';
import 'package:product_list_app/controller/router/app_router.gr.dart';
import 'package:product_list_app/controller/router/router_path.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  
  
   void initState() {
    super.initState();
      _navigateToNextPage();
   

  }
 void dispose() {
  
    super.dispose();
  }

  @override
 

  
  
  _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    
  
         context.router.replace(ProductListScreen());
      }

          
 
  @override
 


  Widget build(BuildContext context) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return 
   Scaffold(
  
         backgroundColor: whiteColor,
          body: Padding(
            padding:  EdgeInsets.all(screenPadding),
            child: Center(
              child: Container()
              //Image.asset('assets/logo.png',width: swidth/2,height: sheight/2,),
            ),
          ),
        );
      }} 