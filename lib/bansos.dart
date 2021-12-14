import 'dart:async';

class Bansos {
  String id;
  Future<Map>? bansosDetails;

  Bansos(this.id);

  @override
  String toString() {
    return id;
  }

  // Future<Map> fetchBansosData() async {

  // }
}
