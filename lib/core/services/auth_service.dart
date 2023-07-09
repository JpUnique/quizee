// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizee/loginScreen/login.dart';
import 'package:quizee/mainScreen/main_screen.dart';

/*class AuthService {

  // Google Sign In
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await signInWithGoogle().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create a credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
      // finally let sign in
      return await FirebaseAuth.instance.signInWithCredential(credential);
    
  }
}
 we have to create an onTap function to call it anywhere where in the app
  final Function()? onTap;  and  required this.onTap, */

class AuthService {
  handleAuthState(String imageUrl) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen(
              genderImage: imageUrl.toString(),
            );
          } else {
            return Login();
          }
        });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // sign up
  Future<User?> signUp(Map<String, dynamic> data, BuildContext context) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data["email"],
        password: data['password'],
      );
      final User? user = userCredential.user;
      if (user != null) return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('The password is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('The account already exists.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('An error occurred.')),
      );
    }
    return null;
  }

  //Sign In
  Future<User?> signIn(BuildContext context,
      {String? email, String? password}) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      final User? user = userCredential.user;
      if (user != null) return user;
    } on FirebaseAuthException catch (e) {
      print('\n\nThe message is: ${e.message}\n\n');
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('The password is too weak.')),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('User/Account does exists.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('An error occurred.')),
      );
    }
    return null;
  }
}
