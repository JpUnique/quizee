// ignore_for_file: unused_element, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.genderImage}) : super(key: key);
  final String genderImage;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  String newValue = '';
  double _progressValue = 0;
   User? currentUser = FirebaseAuth.instance.currentUser;
  
  String _firstName = '';
  String _email = '';
  String _lastName = '';
  String _occupation = '';
  String _age = '';
  // ignore: unused_field
  String _gender = "";

  void _incrementProgress() {
    setState(() {
      _progressValue += 10;
      if (_progressValue > 100) {
        _progressValue = 100;
      }
    });
  }

 
  @override
  void initState() {
    
    super.initState();
    _getCurrentUserData();
  }

  void _getCurrentUserData() async {
 
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.uid)
        .get();
    setState(() {
      _firstName = userDataSnapshot['firstName'];
      _email = userDataSnapshot['email'];
      _lastName = userDataSnapshot['lastName'];
      // _occupation = userDataSnapshot['occupation'];
      _age = userDataSnapshot['age'];
      _gender = userDataSnapshot['gender'];
    });
  }
// User? currentUser = FirebaseAuth.instance.currentUser;
  void _updateUserData() async {
    

    try {
      if (newValue.trim().length > 0) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser!.uid)
            .update({
          // 'firstName': 'NewFirstName',
          // 'lastName': 'NewLastName',
          // 'email': 'NewEmail',
          // //'occupation': 'NewOccupation',
          // 'age': 'NewAge',
          // 'gender': 'NewGender'
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Text("User data updated successfully"),
            );
          },
        );
      }
    } catch (e) {
      print('Error updating user data $e');
    }
  }

  Future<void> editField(String field) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("Edit" + field),
          content: TextField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Enter new $field",
                  hintStyle: TextStyle(color: Colors.grey)),
              onChanged: (value) => newValue = value),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(newValue),
                child: Text('Cancel', style: TextStyle(color: Colors.white))),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Save', style: TextStyle(color: Colors.white)))
          ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(widget.genderImage)),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 100,
                      child: SvgPicture.asset("assets/images/aba.jpeg"),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      width: 80,
                      height: 80,
                      child: SvgPicture.asset("assets/images/ath.jpeg"),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                LinearProgressIndicator(
                  value: .2,
                  minHeight: 16,
                ),
                SizedBox(height: 10),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentUser!.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Column(children: [
                          TextBox(
                            text: userData['firstName'],
                            onPressed: () {
                              editField('firstName');
                            },
                            sectionName: "FirstName",
                          )
                        ]);
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('Error' + snapshot.error.toString()));
                      }
                      ;
                      return const Center(child: CircularProgressIndicator());
                    }),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: _updateUserData,
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.sectionName});
  final text;
  final sectionName;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(text,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.edit, color: Colors.grey))
              ],
            ),
            Text(sectionName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.edit, color: Colors.grey))
          ],
        ));
  }
}


/* Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Enter your first name',
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(text: _firstName),
                    onChanged: (value) {
                      _firstName = value;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Enter your last name',
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(text: _lastName),
                    onChanged: (value) {
                      _lastName = value;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Enter your email',
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(text: _email),
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Enter your occupation',
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(text: _occupation),
                    onChanged: (value) {
                      _occupation = value;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Enter your age',
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(text: _age),
                    onChanged: (value) {
                      _age = value;
                    },
                  ),
                ), */
