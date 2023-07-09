// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:quizee/loginScreen/sign_me.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizee/mainScreen/main_screen.dart';

import '../core/services/auth_service.dart';
import '../core/services/profile_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return const AlertDialog(
            content: Text("Password reset link sent! Check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Future<void> loginUser() async {
    User? user = await AuthService().signIn(
      context,
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (user != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      //check if field exit in a doc
      DocumentSnapshot snapshots =
          await firestore.collection("Users").doc(user.uid).get();
      //  if (snapshots.exists) {
      if (snapshots["email"] == user.email) {
        var url = await ProfileService()
            .getProfilePicture(snapshots["gender"], snapshots["age"]);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    genderImage: url.toString(),
                  )),
        );
      }
      // Handle any error that occurs while fetching the image URL
      print('Error fetching image URL: e');
    }
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         content: Text("Failed"),
    //       );
    //     });
  }

  void _showForgotPasswordPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Forgot Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  passwordReset();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20.0),
                    child: SizedBox(
                      height: 80,
                      width: 200,
                      child: Image.asset("assets/images/aba.jpeg"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: SizedBox(
                      height: 80,
                      width: 200,
                      child: Image.asset('assets/images/abaLogo2.jpg'),
                    ),
                  ),
                  const SizedBox(height: 5),
// InkWell(
//   onTap: (){
//     FirebaseService().upload();
//   },
//   child: Container(
//     color:Colors.red,
//     child: Text("Upload Collections"))),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.account_circle),
                            prefixIconColor: Colors.blue,
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            alignLabelWithHint: false,
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.blue,
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize: 15, fontStyle: FontStyle.normal),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        loginUser();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      _showForgotPasswordPopup();
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 17, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignMe(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign up with E-mail",
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
