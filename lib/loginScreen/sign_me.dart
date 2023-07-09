// ignore_for_file: deprecated_member_use, unnecessary_import, unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:quizee/loginScreen/login.dart';
import 'package:quizee/mainScreen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizee/core/services/auth_service.dart';
import 'package:flutter/services.dart';

import '../core/services/profile_service.dart';

class SignMe extends StatefulWidget {
  const SignMe({Key? key}) : super(key: key);

  @override
  State<SignMe> createState() => _SignMeState();
}

class _SignMeState extends State<SignMe> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Map<String, dynamic> data = {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
      };
      User? user = await AuthService().signUp(data, context);

      if (user != null) {
        await addUserDetails(
          user.uid,
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          int.parse(_ageController.text.trim()),
          _emailController.text.trim(),
          _genderController.text.trim(),
        );

        var url = await ProfileService()
            .getProfilePicture(_selectedGender!, _ageController.text.trim());
        setState(() {});
        print(url);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    genderImage: url,
                  )),
        );
      }
    }
  }

  Future<void> addUserDetails(String userId, String firstName, String lastName,
      int age, String email, String gender) async {
    await FirebaseFirestore.instance.collection('Users').doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
      'id': userId,
      'gender': gender,
    });
  }

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20.0),
                    child: SizedBox(
                      height: 80,
                      width: 200,
                      child: Image.asset("assets/images/aba.jpeg"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: SizedBox(
                      height: 80,
                      width: 150,
                      child: Image.asset('assets/images/abaLogo2.jpg'),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 20,
                      child: Text(
                        'Therapy Group',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "First Name",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        labelText: 'First Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your first name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Last Name",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        labelText: 'Last Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your last name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Gender",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a gender.';
                        }
                        return null;
                      },
                      onTap: () async {
                        final selectedValue = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              title: Text('Gender'),
                              content: DropdownButtonFormField<String>(
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue!;
                                  });
                                },
                                items: ['Male', 'Female'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop(_selectedGender);
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        if (selectedValue != null) {
                          setState(() {
                            _selectedGender = selectedValue;
                          });
                        }
                      },
                      controller: TextEditingController(text: _selectedGender),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your age.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 17,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      _signUp();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 17, fontStyle: FontStyle.italic),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      AuthService().signInWithGoogle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MainScreen(genderImage: "assets/images/"),
                          ));
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image(
                        image: AssetImage('assets/images/google.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
