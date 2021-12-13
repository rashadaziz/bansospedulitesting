import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './bansos.dart';

class BansosList extends StatefulWidget {
  const BansosList({Key? key}) : super(key: key);

  @override
  _BansosListState createState() => _BansosListState();
}

class _BansosListState extends State<BansosList> {
  List<String> allBansosID = [
    "#Test1",
    "#id2",
    "#id3",
    "#id4"
  ]; // TODO implement fetching of user bansos id's

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allBansosID.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("Bansos ${allBansosID[index]}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.read_more_sharp),
            tileColor: index % 2 == 0 ? Colors.blue[100] : Colors.blue[300],
            onTap: () => {},
          ),
        );
      },
    );
  }
}
