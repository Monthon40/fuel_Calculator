import 'package:driving_app/function.dart';
import 'package:driving_app/map/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../UsersAccount/login_screen.dart';
import 'fouth_screen.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalculationWidget extends StatefulWidget {
  final int test;
  CalculationWidget({required this.test});
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  _CalculationWidgetState createState() => _CalculationWidgetState();
}

class _CalculationWidgetState extends State<CalculationWidget>
    with TickerProviderStateMixin {
  late String dropDownValue;

  double rain = 0.00;
  var rainPercent;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _car = FirebaseFirestore.instance
      .collection('userData')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('profile');

  getData() async {
    // weatherData = await getWeatherData();
    // gasData = await getGasData();
    // print(weatherData[0]["Province"]);
    // print(gasData[0]["today"]);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        // key: _formKey,
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(195, 8, 0, 8),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.red,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                          ),
                          onPressed: () async {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                ),
                              ),
                            );
                          },
                          child: Text("Sign Out"),
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
      body: SingleChildScrollView(
        child: Card(
          elevation: 20,
          margin: EdgeInsets.all(5),
          color: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 7),
                              child: Text(
                                'Weather (3 hours)',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 10),
                              child: IconButton(
                                icon: Icon(Icons.refresh),
                                color: Color(0xFF57636C),
                                onPressed: () async {
                                  weatherData = await getWeatherData();
                                },
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(5),
                          child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            spacing: -2,
                            children: [
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                ),
                                color: kBrightCardColor,
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Column(
                                      children: [
                                        weatherLogo(2),
                                        Flexible(
                                            child: new Text(
                                                "${weatherData[2]["Province"]}"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                ),
                                color: kBrightCardColor,
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Column(
                                      children: [
                                        weatherLogo(8),
                                        Flexible(
                                            child: new Text(
                                                "${weatherData[8]["Province"]}"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                ),
                                color: kBrightCardColor,
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Column(
                                      children: [
                                        weatherLogo(14),
                                        // Text("กรุงเทพฯ"),
                                        Flexible(
                                            child: new Text(
                                                "${weatherData[14]["Province"]}"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                ),
                                color: kBrightCardColor,
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Column(
                                      children: [
                                        weatherLogo(20),
                                        Flexible(
                                            child: new Text(
                                                "${weatherData[20]["Province"]}"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                ),
                                color: kBrightCardColor,
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Column(
                                      children: [
                                        weatherLogo(26),
                                        // Text("อยุธยา"),
                                        Flexible(
                                            child: new Text(
                                                "${weatherData[26]["Province"]}"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                ),
                                color: kBrightCardColor,
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Column(
                                      children: [
                                        weatherLogo(32),
                                        Flexible(
                                            child: new Text(
                                                "${weatherData[32]["Province"]}"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),

                  ),
                ),
                StreamBuilder(
                  stream: _car.snapshots(),
                  builder: ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if( streamSnapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    } else if( streamSnapshot.hasError){
                      return Center(child: Text('Something went wrong!'));
                    }
                    else
                    if (streamSnapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              final docsnap = streamSnapshot.data!.docs[ccar];
                              return _screen(
                                  name: docsnap['name'],
                                  fuel: docsnap['fuel'],
                                  num: docsnap['item']);
                            }),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _screen({required String name, required String fuel, required int num}) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: Text(
                "Profile: "+ name ,
                style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Image.network(
          'https://st.depositphotos.com/1826082/3755/v/380/depositphotos_37558013-stock-illustration-logo-of-auto.jpg?forcejpeg=true',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'The Distance for this trip is:',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Text(
            "${distance}",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 0, 10, 10),
                    child: Text(
                      'Your Fuel Consumption:',
                      style:
                          TextStyle(fontSize: 19),
                    ),
                  ),
                  Text(
                    fuel,
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                    child: Text(
                      'Fuel Price:',
                      style:
                          TextStyle(fontSize: 19),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                    child: Text(
                      gasData[num]["today"],
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Container(
            height: 130,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.02, -0.21),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  kDarkCardColor,
                                  kDarkCardColor,
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            double money = 0.00;
                            double range = double.parse(distance);
                            double km_L = double.parse(fuel);
                            double price = double.parse(gasData[num]["today"]);
                            money = (range / km_L) * price;
                            if (rain < 0.5) {
                              money = money + ((money * 5) / 100);
                            } else if (rain < 4) {
                              money = money + ((money * 8) / 100);
                            } else if (rain < 8) {
                              money = money + ((money * 12) / 100);
                            } else {
                              money = money + ((money * 15) / 100);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CalculateWidget(
                                  totol: money,
                                ),
                              ),
                            );
                          },
                          child: const Text('calculate'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  weatherLogo(int data) {
    rainPercent = double.parse(weatherData[data]["Observation"]["Rainfall"]);
    // print("$ccar" + " this ");
    if (rainPercent == 0) {
      // return Text("$rainPercent");
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Haze_Heat_Sun_Low_Visibility_Apple_Flat_iOS_Weather-512.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else if (rainPercent > 0 && rainPercent <= 0.5) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Scattered_Showers_Rain_Showers_Raindrops_Apple_iOS_Flat_Weather-512.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else if (rainPercent > 0.5 && rainPercent <= 4) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Drizzle_Rain_Raindrops_Apple_iOS_Flat_Weather-128.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else if (rainPercent > 4 && rainPercent <= 8) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Heavy_rain_Rain_Raindrops_Apple_iOS_Flat_Weather-128.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
      //
    } else {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-black-white/50/Rainfall_Rain_Lightning_Tempest_Apple_Weather-128.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
