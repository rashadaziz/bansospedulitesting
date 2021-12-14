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
            ? Container(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Text.rich(TextSpan(
                          text: "Responsible Admin: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text:
                                    "${bansos.bansosDetails!['responsible_admin']}",
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ])),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: const Text("Info Bansos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Text.rich(TextSpan(
                          text: "Provinsi: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${bansos.bansosDetails!['provinsi']}",
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ])),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Text.rich(TextSpan(
                          text: "Kecamatan: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${bansos.bansosDetails!['kecamatan']}",
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ])),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Text.rich(TextSpan(
                          text: "Kelurahan: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${bansos.bansosDetails!['kelurahan']}",
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ])),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Text.rich(TextSpan(
                          text: "Arrived On: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${bansos.bansosDetails!['timestamp']}",
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ])),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: const Text("Bentuk Bantuan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                          )),
                    ),
                  ],
                ))
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
