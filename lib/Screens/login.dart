// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously, dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_streaming/Screens/mainscreen.dart';
import 'package:video_streaming/Screens/regisgration.dart';
import 'package:video_streaming/Services/firebaseauth.dart';
import 'package:video_streaming/widgets/button.dart';
import 'package:video_streaming/widgets/fonts.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formkey = GlobalKey<FormState>();
  bool _issecured = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String? _validateEmail(String? email) {
    RegExp emailRegex =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(30, 50, 56, 1),
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      height: 90,
                      width: 30,
                    ),
                    Text(
                      'BUZZ',
                      style: textfont(20, FontWeight.bold, Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 250,
                  child: Image.asset('images/login.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Form(
                    key: _formkey,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          )),
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              controller: _email,
                              decoration: const InputDecoration(
                                hintText: 'Email Address',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              obscureText: _issecured,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _password,
                              decoration: InputDecoration(
                                suffixIcon: togglepassword(),
                                hintText: 'Password',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: textfont(20, FontWeight.bold,
                                      Colors.yellow.shade800),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CheckOutButton(
                              text: 'LOGIN',
                              onTap: () async {
                                if (_email.text == '' || _password.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'All fields are required',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    backgroundColor: Colors.grey,
                                  ));
                                } else {
                                  User? result = await Authservice().Login(
                                      _email.text, _password.text, context);
                                  if (result != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  }
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Dont Have An Account?',
                                    style: textfont(
                                        15, FontWeight.normal, Colors.black)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: Text('SignUp',
                                      style: textfont(20, FontWeight.bold,
                                          Colors.yellow.shade800)),
                                )
                              ],
                            ),
                          ])),
                    ),
                  ),
                )
              ]),
        ),
      )),
    );
  }

  Widget togglepassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _issecured = !_issecured;
        });
      },
      icon: _issecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
