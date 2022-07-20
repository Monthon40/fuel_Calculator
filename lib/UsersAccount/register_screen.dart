import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';
  String name = '';
  final db = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Sign Up Page'),
      ),
      body: Card(
        color: Colors.black38,
        elevation: 20,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: const Text('Create Account'),
                      onPressed: () async {
                        //print("create account with $email , $password");
                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(
                              email: email, password: password,);
                          /*final uid = await FirebaseAuth.instance.currentUser?.uid;
                          await db.collection("userData").doc(uid).collection("displayName").add(
                              {
                                'name': name,
                              }
                          );*/
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        } catch (e) {
                          print(e);
                        }
                      }),
                ),
                Row(
                  children: <Widget>[
                    const Text('Already Have an account?', style: TextStyle(color: Colors.white),),
                    TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {print('Login');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}