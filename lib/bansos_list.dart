import 'dart:convert';

import 'package:bansospedulimobileprototype/bansos_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import './bansos.dart';

getUserBansos() async {
  var reponse = await get(Uri.https("my-json-server.typicode.com",
      "rashadaziz/bansospedulitesting/all_bansos"));

  var data = jsonDecode(reponse.body);
  List<Bansos> allUserBansos = [];

  for (var id in data) {
    allUserBansos.add(Bansos(id));
  }

  return Future.delayed(const Duration(seconds: 2), () => allUserBansos);
}

class BansosList extends StatefulWidget {
  const BansosList({Key? key}) : super(key: key);

  @override
  _BansosListState createState() => _BansosListState();
}

class _BansosListState extends State<BansosList> {
  var allBansosID =
      getUserBansos(); // later this function will accept user parameter

  Future<void> refreshPage() async {
    setState(() {
      allBansosID = getUserBansos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: FutureBuilder(
          future: allBansosID,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 5,
              ));
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              List<Bansos> bansosID = snapshot.data! as List<Bansos>;
              return ListView.builder(
                  itemCount: bansosID.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5,
                        child: ListTile(
                          subtitle: Text("click to view details"),
                          title: Text("BANSOS ${bansosID[index]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                          trailing: const Icon(
                            Icons.arrow_right,
                            color: Colors.blue,
                          ),
                          tileColor: Colors.blue[50],
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BansosDetails(bansos: bansosID[index])))
                          }, // route to details page based on the bansosID
                        ));
                  });
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 5,
              ));
            }
          },
        ),
        onRefresh: refreshPage);
  }
}
