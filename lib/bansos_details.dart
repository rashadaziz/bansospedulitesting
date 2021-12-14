import 'package:bansospedulimobileprototype/bansos.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BansosDetails extends StatelessWidget {
  final Bansos bansos;
  const BansosDetails({Key? key, required this.bansos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Details for Bansos ID#$bansos",
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.blue,
          elevation: 0,
        ),
        body: bansos.bansosDetails != null
            ? Container(child: Text("${bansos.bansosDetails}"))
            : FutureBuilder(
                future: bansos.fetchBansosData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 5,
                    ));
                  } else {
                    return Text("${snapshot.data}");
                  }
                },
              ));
  }
}
