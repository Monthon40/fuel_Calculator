import 'package:driving_app/UsersAccount/register_screen.dart';
import 'package:driving_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../welcome_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Login Page'),
      ),
      body: Card(
        elevation: 20,
        margin: EdgeInsets.all(20),
        color: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.all(50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("logo.png"),
                const SizedBox(height: 30),
                TextField(
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.0),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.0),
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.black12,

                  ),
                ),
                ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Login Sucessfully'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          print("$email is in.");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeWidget()));
                        } else {
                          print("Login failed");
                        }
                      } catch (e) {

                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Colors.grey,
                            title: const Text('Login Failed', style: TextStyle(color: Colors.red),),
                            content: const Text('Email or Password is wrong!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ,),
                              ),
                            ],
                          ),
                        );
                        //print("Login failed");
                      }
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                    ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?', style: TextStyle(color: Colors.white),),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {print('register');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()));
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
