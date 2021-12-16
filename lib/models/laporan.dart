import 'dart:async';
import 'package:http/http.dart';

class Laporan {
  String id;
  Map? laporanDetails;

  Laporan(this.id);

  Future<Map> fetchLaporanData() async {
    return {};
  }
}
