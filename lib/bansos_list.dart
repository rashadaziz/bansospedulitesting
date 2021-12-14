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
    Bansos bansos = Bansos(id);
    allUserBansos.add(bansos);
    // bansos.fetchBansosData();
  }

  return Future.delayed(const Duration(seconds: 2), () => allUserBansos);
}

class BansosList extends StatefulWidget {
  const BansosList({Key? key}) : super(key: key);

  @override
  _BansosListState createState() => _BansosListState();
}

class _BansosListState extends State<BansosList> {
  int counter = 0;
  Timer? _timer;
  var allBansosID =
      getUserBansos(); // later this function will accept user parameter
  bool updateAvailable = false;

  Future<void> refreshPage() async {
    setState(() {
      allBansosID = getUserBansos();
      updateAvailable = false;
    });
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkForUpdates();
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    super.dispose();
  }

  void checkForUpdates() async {
    List<Bansos> currentBansos = await allBansosID;
    List<Bansos> maybeNewBansos = await getUserBansos();
    bool thereIsNewBansos = currentBansos.length != maybeNewBansos.length;
    if (thereIsNewBansos && updateAvailable == false) {
      setState(() {
        updateAvailable = true;
      });
    }
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
                  itemCount: bansosID.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: const Text(
                              "Choose Bansos to Report",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          updateAvailable
                              ? Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.arrow_downward_outlined),
                                      Text(
                                          "You have new Bansos Arriving, Pull Down To Refresh")
                                    ],
                                  ),
                                )
                              : const Text("")
                        ],
                      );
                    } else {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            subtitle: Text("click to view details"),
                            title: Text("BANSOS ${bansosID[index - 1]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.blue,
                            ),
                            tileColor: Colors.blue[100],
                            onTap: () => {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BansosDetails(
                              //             bansos: bansosID[index - 1])))
                            }, // route to details page based on the bansosID
                          ));
                    }
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
