import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../loginScreen/login.dart';

class ForgotPassword extends StatefulWidget {
   ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return const AlertDialog(
            content: Text("Password reset link sent! Check your email"),
          );
        },
      );

      // Prompt the user to enter their new password after resetting
      await Future.delayed(const Duration(seconds: 3));
      final newPassword = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Enter your new password'),
            content: const TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'New Password'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      // Update the user's password with the new one
      final User? user = FirebaseAuth.instance.currentUser;
      await user!.updatePassword(newPassword!);
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return const AlertDialog(
            content: Text("Password updated successfully!"),
          );
        },
      );

      // Navigate back to the login screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } on FirebaseAuthException catch (e) {
      print(e);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                      hintText: "Email",
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  passwordReset();
                },
                child: const Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
