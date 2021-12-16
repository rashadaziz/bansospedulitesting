import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import '../models/laporan.dart';
import '../ui/custom_radio.dart';

class GenerateReport extends StatelessWidget {
  final String? bansosID;
  final Laporan? laporan;
  final bool isUpdating;
  final _radioKey = GlobalKey();
  GenerateReport(
      {Key? key, this.bansosID, this.laporan, required this.isUpdating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Report"),
      ),
      body: Center(
        child: Column(
          children: [
            CustomRadio(
              key: _radioKey,
              radioOneTitle: "Product Expired",
              radioOneValue: "expired",
              radioTwoTitle: "Product Insufficient",
              radioTwoValue: "insufficient",
              radioThreeTitle: "Other",
              radioThreeValue: "other",
              borderRadius: 10,
            ),
            ElevatedButton(
                onPressed: () => {print(_radioKey.currentState)},
                child: Text("test"))
          ],
        ),
      ),
    );
  }
}
