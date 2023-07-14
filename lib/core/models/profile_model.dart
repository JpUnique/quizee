import 'dart:convert';

import 'package:flutter/material.dart';

class Profile {
  final String firstName;
  final String lastName;
  final String email;
  final int age;
  final String gender;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.gender,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: "${json["firstName"]}",
      lastName: "${json["lastName"]}",
      email: "${json["email"]}",
      age: json["age"] ?? 0,
      gender: "${json["gender"]}",
    );
  }

  factory Profile.parse(String str) {
    final decoded = json.decode(str);
    if (decoded == null) throw Error();
    return Profile.fromJson(decoded);
  }

  Alias get alias {
    if (gender == 'male') {
      if (age < 18) {
        return Alias.boy;
      } else {
        return Alias.man;
      }
    } else {
      if (age < 18) {
        return Alias.girl;
      } else {
        return Alias.lady;
      }
    }
  }

  ImageProvider get avatar {
    final avatars = <Alias, ImageProvider>{
      Alias.boy: const AssetImage('path'),
      Alias.girl: const AssetImage('path'),
      Alias.lady: const AssetImage('path'),
      Alias.man: const AssetImage('path'),
    };
    return avatars[alias] ?? const AssetImage('path');
  }

  Image get avatarImage => Image(image: avatar);

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'age': age,
    };
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

enum Alias { boy, girl, lady, man }
