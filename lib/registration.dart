

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
class test1 extends StatelessWidget {
  const test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: registration(),
    );
  }
}


class registration extends StatefulWidget {
  const registration({super.key});


  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _designation = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  //Image Picker function to get image from camera


  @override
  void initState() {
    checkdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_left,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 3, color: Colors.black),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Let's registration ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter your First name',
                      labelText: 'First name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    controller: _fname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter your Last name',
                      labelText: 'Last name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    controller: _lname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter your phone number',
                      labelText: 'phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    controller: _mobile,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter your designation',
                      labelText: 'Designation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    controller: _designation,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your designation';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter your Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter your password',
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: true,
                    controller: _password,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                  child: ElevatedButton(
                    onPressed: () {
                      //showOptions();
                    },
                    child: Text("select image",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 3, color: Colors.black),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 70,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      String phone = _email.text.toString();
                      if (_formkey.currentState!.validate()) {

                          Fluttertoast.showToast(
                              msg: "registration success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          logindata.setBool('tops', false);
                          print("1");
                          logindata.setString('email', phone);
                          logindata.setString('fname', phone);
                          logindata.setString('lname', phone);
                          logindata.setString('phone', phone);
                          logindata.setString('designation', phone);
                          print("2");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));

                      } else {
                        Fluttertoast.showToast(
                            msg: "registration fail",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Text("Sign in",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 3, color: Colors.black),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkdata() async {
    logindata = await SharedPreferences.getInstance(); //initialize sharedprefrence
    newuser = logindata.getBool('tops') ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => homepage()));
    }
  }
}
