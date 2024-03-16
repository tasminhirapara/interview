import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: signin(),
    );
  }
}


class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin>
{
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;
  @override
  void initState() {
    checkdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child:Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(20),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_left,),style: ElevatedButton.styleFrom(
                primary: Colors.white, //background color of button
                side: BorderSide(width:3, color:Colors.black), //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.all(20) ,//content padding inside button
              ),),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Let's Log you in",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),SizedBox(height: 5,),
            Text("Welcome back",style: TextStyle(color: Colors.blueGrey,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),SizedBox(height: 5,),
            Text("You've been missed!",style: TextStyle(color: Colors.blueGrey,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(decoration:InputDecoration(
                //icon: Icon(Icons.phone,),
                hintText: 'enter your email',
                labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),),
              ),
                controller: _email,
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'please enter your email';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(decoration:InputDecoration(
                // icon: Icon(Icons.password),

                hintText: 'enter your password',
                labelText: 'password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),),
              ),
                obscureText: true,
                controller: _password,
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'please enter you password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 300,
              child: ElevatedButton(onPressed: (){

                String phone= _email.text.toString();
                if(_formkey.currentState!.validate())
                {
                  if(_email.text=="7359044160" && _password.text=="123")
                  {
                    Fluttertoast.showToast(
                        msg: "login success",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    logindata.setBool('tops', false);
                    print("1");
                    logindata.setString('email',phone);
                    print("2");
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homepage()));
                  }

                }
                else
                {
                  Fluttertoast.showToast(
                      msg: "login fail",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                }


              }, child: Text("Sign in",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),style: ElevatedButton.styleFrom(
                primary: Colors.white, //background color of button
                side: BorderSide(width:3, color:Colors.black), //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.all(20) ,//content padding inside button
              ),),
            ),


          ],
        ),

      ),
    );
  }
  void checkdata() async
  {
    logindata = await SharedPreferences.getInstance();//initialize sharedprefrence
    newuser = logindata.getBool('tops') ?? true;

    if(newuser==false)
    {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => homepage()));
    }
  }
}
