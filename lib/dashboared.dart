import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
import 'login.dart';

class dashboared extends StatefulWidget
{
  const dashboared({super.key});

  @override
  State<dashboared> createState() => _dashboaredState();
}

class _dashboaredState extends State<dashboared> {
  late SharedPreferences logindata;
  late bool newuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),

            Image.asset("images/preview.jpg", height: 400, width: 500,),

            Text("Welcome to Monymaker ", style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 70,
              width: 300,
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => test()));
              },
                child: Text("Login", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  //background color of button
                  side: BorderSide(width: 3, color: Colors.black),
                  //border width and color
                  elevation: 3,
                  //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  padding: EdgeInsets.all(20), //content padding inside button
                ),),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 300,
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => test1()));
              },
                child: Text("Registration", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  //background color of button
                  side: BorderSide(width: 3, color: Colors.black),
                  //border width and color
                  elevation: 3,
                  //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  padding: EdgeInsets.all(20), //content padding inside button
                ),),
            ),

          ],
        ),


      ),
      backgroundColor: Colors.white,
    );
  }

  void checkdata() async
  {
    logindata =
    await SharedPreferences.getInstance(); //initialize sharedprefrence
    newuser = logindata.getBool('tops') ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => homepage()));
    }
  }
}
