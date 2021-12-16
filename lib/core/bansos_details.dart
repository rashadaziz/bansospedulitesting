import 'package:bansospedulimobileprototype/models/bansos.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:collection/collection.dart';
import 'generate_report.dart';

class BansosDetails extends StatelessWidget {
  final Bansos bansos;
  const BansosDetails({Key? key, required this.bansos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(width: 0.25)),
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: DataTable(
                        headingRowColor:
                            MaterialStateProperty.all(Colors.blue[300]),
                        headingRowHeight: 45,
                        dataRowColor:
                            MaterialStateProperty.all(Colors.grey[200]),
                        dividerThickness: 2,
                        showBottomBorder: true,
                        columns: const [
                          DataColumn(label: Text("Bentuk")),
                          DataColumn(label: Text("Jumlah"))
                        ],
                        rows: [
                          ...bansos.bansosDetails!["bentuk_bantuan"].entries
                              .map((bentuk) {
                            var bentukBantuanData = bansos
                                .bansosDetails!["bentuk_bantuan"][bentuk.key];
                            var jumlah = bentukBantuanData["jumlah"];
                            var satuan = bentukBantuanData["satuan"];
                            return DataRow(cells: [
                              DataCell(Text("${bentuk.key}")),
                              DataCell(Text("$jumlah $satuan")),
                            ]);
                          })
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: width * 0.5,
                      child: ElevatedButton(
                        child: Text("REPORT"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GenerateReport(isUpdating: false)))
                        },
                      ),
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
                    return Container(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, right: 20),
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
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
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
                                        text:
                                            "${bansos.bansosDetails!['provinsi']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
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
                                        text:
                                            "${bansos.bansosDetails!['kecamatan']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
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
                                        text:
                                            "${bansos.bansosDetails!['kelurahan']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
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
                                        text:
                                            "${bansos.bansosDetails!['timestamp']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
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
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.25)),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 3, bottom: 3),
                              child: DataTable(
                                headingRowColor:
                                    MaterialStateProperty.all(Colors.blue[300]),
                                headingRowHeight: 45,
                                dataRowColor:
                                    MaterialStateProperty.all(Colors.grey[200]),
                                dividerThickness: 2,
                                showBottomBorder: true,
                                columns: const [
                                  DataColumn(label: Text("Bentuk")),
                                  DataColumn(label: Text("Jumlah"))
                                ],
                                rows: [
                                  ...bansos
                                      .bansosDetails!["bentuk_bantuan"].entries
                                      .map((bentuk) {
                                    var bentukBantuanData =
                                        bansos.bansosDetails!["bentuk_bantuan"]
                                            [bentuk.key];
                                    var jumlah = bentukBantuanData["jumlah"];
                                    var satuan = bentukBantuanData["satuan"];
                                    return DataRow(cells: [
                                      DataCell(Text("${bentuk.key}")),
                                      DataCell(Text("$jumlah $satuan")),
                                    ]);
                                  })
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: width * 0.5,
                              child: ElevatedButton(
                                child: Text("REPORT"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GenerateReport(
                                              isUpdating: false)))
                                },
                              ),
                            )
                          ],
                        ));
                  }
                },
              ));
  }
}
