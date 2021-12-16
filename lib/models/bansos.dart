import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class Bansos {
  String id;
  Map? bansosDetails;

  Bansos(this.id);

  @override
  String toString() {
    return id;
  }

  DateTime parseDate(String pythonDate) {
    String month = pythonDate.substring(0, 2);
    String day = pythonDate.substring(3, 5);
    String year = pythonDate.substring(6, 10);
    String timestamp = pythonDate.substring(12);
    String dartDate = "$year-$month-$day $timestamp";

    return DateTime.parse(dartDate);
  }

  Future<Map?> fetchBansosData() async {
    var reponse = await get(Uri.https("my-json-server.typicode.com",
        "rashadaziz/bansospedulitesting/bansos_details"));
    Map allData = jsonDecode(reponse.body);
    Map data = allData[id];
    String timestamp = data["timestamp"];
    data["timestamp"] = parseDate(timestamp);

    bansosDetails = data;

    return data;
  }
}
