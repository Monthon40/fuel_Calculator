import 'package:driving_app/constants.dart';
import 'package:driving_app/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenWidgetState createState() => _SecondScreenWidgetState();
}

class _SecondScreenWidgetState extends State<SecondScreen> {
  String dropDownValue = 'Gasohol 91 S EVO';
  TextEditingController emailAddressController1 = TextEditingController();
  TextEditingController emailAddressController2 = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase =
      Firebase.initializeApp(); // get firebase ready
  CollectionReference _carmodel = FirebaseFirestore.instance.collection("CarModel");
  final db = FirebaseFirestore.instance;
  
  var items = [
    'Hi Premium Diesel S B7',
    'Diesel S B7',
    'HI DIESEL S',
    'HI DIESEL B20 S',
    'Gasohol E85 S EVO',
    'Gasohol E20 S EVO',
    'Gasohol 91 S EVO',
    'Gasohol 95 S EVO',
  ];
  List profile = [];
  @override
  void initState() {
    super.initState();
    profile = Rom.get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Eror"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              key: scaffoldKey,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                key: _formKey,
                child: AppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  iconSize: 26,
                                  color: Colors.white,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  elevation: 0,
                ),
              ),
              backgroundColor: Colors.blueGrey,
              body: Card(
                elevation: 20,
                margin: EdgeInsets.all(20),
                color: Colors.black38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            'Create Profile',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: kExtra3Color,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Text(
                                    'Create your account by filling in the information below to access the app.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: kBox,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x4D101213),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                                //validator: RequiredValidator(errorText: "Please Enter Your car model"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(

                                  labelText: 'Car model',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kButtonColor,
                                  ),
                                  hintText: 'Enter your Car model...',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: kButtonColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: kBox,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: kButtonColor,
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: kBox,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x4D101213),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: emailAddressController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Fuel Economy',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: kButtonColor,
                                ),
                                hintText: 'Enter your Fuel Economy...',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: kButtonColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: kBox,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: kButtonColor,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: kBox,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x4D101213),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 355,
                                  height: 60,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(10)),
                                        borderSide: BorderSide(width: 0.1),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(color: kExtra3Color),
                                      hintText: "Select your Fuel",
                                      fillColor: kBox,
                                    ),
                                    value: dropDownValue,
                                    icon: Icon(
                                      Icons.local_gas_station,
                                      size: 15,
                                    ),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: kButtonColor),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropDownValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF0D47A1),
                                          Color(0xFF1976D2),
                                          Color(0xFF42A5F5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(16.0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () async{
                                    if(emailAddressController1.text.isEmpty || emailAddressController2.text.isEmpty || dropDownValue.isEmpty ){
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Please fill in all the information'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Added Profile'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      final uid = await FirebaseAuth.instance.currentUser?.uid;
                                      await db.collection("userData").doc(uid).collection("profile").add(
                                          {
                                            'name': emailAddressController1.text,
                                            'fuel': emailAddressController2.text,
                                            'item': items.indexOf(dropDownValue),
                                          }
                                      );
                                      Navigator.pop(context);
                                    }

                                    // profile.add({
                                    //   "name": emailAddressController1.text,
                                    //   "fuel": emailAddressController2.text,
                                    //   "item": items.indexOf(dropDownValue),
                                    // });
                                    // Navigator.pop(context);
                                    // Rom.set(profile);

                                  },
                                  child: const Text('Create Profile'),
                                ),
                              ],
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
