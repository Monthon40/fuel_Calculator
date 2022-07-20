import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_app/function.dart';
import 'package:driving_app/map/map.dart';
import 'package:driving_app/third_screen.dart';
import 'package:driving_app/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'UsersAccount/login_screen.dart';
import 'constants.dart';
import 'second_screen.dart';
import 'map/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenWidget createState() => _HomeScreenWidget();
}

class _HomeScreenWidget extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List profile = [];
  String? selectedValue;
  final Box = GetStorage();

  final _car = FirebaseFirestore.instance
      .collection('userData')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('profile');

  getData() async {
    weatherData = await getWeatherData();
    gasData = await getGasData();
    gasData = await getGasData();
    gasData = await getGasData();
    gasData = await getGasData();
    gasData = await getGasData();
    gasData = await getGasData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("restart");
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    // profile = Rom.get();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text('Hello!    ' + user.email!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 5, 8),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.red,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text("Sign Out"),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),
            ),
          ).then((_) => setState(() => null));
        },
        backgroundColor: Colors.blue,
        elevation: 8,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 15, 16, 8),
                    child: Text('Calculate Fuel App',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: kButtonColor,
                        )),
                  ),
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(130, 8, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.refresh),
                      color: kBrightCardColor,
                      onPressed: () async {
                        gasData = await getGasData();
                        // print(gasData);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 15, 16, 8),
                child: Container(
                  // alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x411D2429),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(70, 0, 0, 10),
                            child: Text(
                              'Today Fuel Price (Bangchak)',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Hi Premium Diesel S B7 ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text("Diesel S B7",
                                      style: TextStyle(color: Colors.white)),
                                  Text("HI DIESEL S ",
                                      style: TextStyle(color: Colors.white)),
                                  Text("HI DIESEL B20 S ",
                                      style: TextStyle(color: Colors.white)),
                                  Text("Gasohol E85 S EVO ",
                                      style: TextStyle(color: Colors.white)),
                                  Text("Gasohol E20 S EVO ",
                                      style: TextStyle(color: Colors.white)),
                                  Text("Gasohol 91 S EVO ",
                                      style: TextStyle(color: Colors.white)),
                                  Text("Gasohol 95 S Evo ",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Column(
                                children: [
                                  isLoaded(),
                                  isLoaded1(),
                                  isLoaded2(),
                                  isLoaded3(),
                                  isLoaded4(),
                                  isLoaded5(),
                                  isLoaded6(),
                                  isLoaded7(),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text('Select Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: kButtonColor,
                    )),
              ),
              _showTask(),
            ],
          ),
        ),
      ),
    );
  }

  _showTask() {
    return StreamBuilder(
      stream: _car.snapshots(),
      builder: ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (streamSnapshot.hasError) {
          return Center(child: Text('Something went wrong!'));
        } else if (streamSnapshot.hasData) {
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final docsnap = streamSnapshot.data!.docs[index];
                  return Dismissible(
                      key: Key(docsnap["name"]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        color: Colors.red,
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      onDismissed: (direction) async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Removed Profile'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        _car.doc(docsnap.id).delete();

                        // await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        //   await myTransaction.delete(docsnap.data.doc[index].reference);
                        // });
                      },
                      child: display(
                          name: docsnap['name'],
                          fuel: docsnap['fuel'],
                          length: index));
                }),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  display({required String name, required String fuel, required int length}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: InkWell(
        onTap: () async {
          ccar = length;
          print(ccar);
          print("--------------");
          await Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => CalculationWidget(test: 1),
              // builder: (context) => MapView(),
              builder: (context) => mapScreen(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black26,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x411D2429),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0),
                          child: Text(fuel,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF57636C),
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 4, 8),
                      child: Text('KM/l',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  isLoaded() {
    if (gasData != null) {
      // box.write(gasData.toString(), gasData[0]["today"]);
      // box.remove(gasData.toString());
      print(box.read(gasData.toString()));
      // return Text("${box.read(gasData.toString())}");
      return Text("${gasData[0]["today"]}",
          style: TextStyle(color: Colors.white));
    } else if (gasData == null && gasOld != null) {
      return Text("special case");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded1() {
    if (gasData != null) {
      return Text("${gasData[1]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded2() {
    if (gasData != null) {
      return Text("${gasData[2]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded3() {
    if (gasData != null) {
      return Text("${gasData[3]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded4() {
    if (gasData != null) {
      return Text("${gasData[4]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded5() {
    if (gasData != null) {
      return Text("${gasData[5]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded6() {
    if (gasData != null) {
      return Text("${gasData[6]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded7() {
    if (gasData != null) {
      return Text("${gasData[7]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  testLoad() {
    if (gasOld != null) {
      return Text("heelo" + "${gasOld[0]["today"]}",
          style: TextStyle(color: Colors.white));
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }
}
