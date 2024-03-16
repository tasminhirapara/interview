import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview/dashboared.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(home : splashscreen(),debugShowCheckedModeBanner: false,));
}

class splashscreen extends StatefulWidget
{
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
{
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 4),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>dashboared())));
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Lottie.asset("images/Animation.json",),
      ),
    );
  }
}

