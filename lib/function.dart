import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

String _gasLink = "https://crmmobile.bangchak.co.th/webservice/oil_price.aspx";
String _weatherLink =
    "https://data.tmd.go.th/api/Weather3Hours/V2/?uid=api&ukey=api12345";

Xml2Json _x2j = Xml2Json();
final box = GetStorage();

Future getWeatherData() async {
  try {
    Response res =
        await get(Uri.parse(_weatherLink)).timeout(Duration(seconds: 20));
    print(res.body);
    _x2j.parse(res.body);
    String json = _x2j.toParker();
    return jsonDecode(json)["Weather3Hours"]["Stations"]["Station"];
  } on TimeoutException {
    return {"error": "Timeout"};
  } on SocketException {
    return {"error": "Socket"};
  } catch (e) {
    return {"error": e};
  }
}

Future getGasData() async {
  try {
    Response res =
        await get(Uri.parse(_gasLink)).timeout(Duration(seconds: 20));
    print(res.body);
    _x2j.parse(res.body);
    String json = _x2j.toParker();
    return jsonDecode(json)["header"]["item"];
  } on TimeoutException {
    return {"error": "Timeout"};
  } on SocketException {
    return {"error": "Socket"};
  } catch (e) {
    return {"error": e};
  }
}

class Rom {
  static set(var data) => box.write('profile', data);
  static get() {
    return box.read('profile') ?? [];
  }
  // static save(var data) =>box.write('gas price', data);
}
