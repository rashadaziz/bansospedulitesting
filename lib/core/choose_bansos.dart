import 'package:flutter/material.dart';
import 'bansos_list.dart';

class ChooseBansos extends StatelessWidget {
  const ChooseBansos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text.rich(TextSpan(text: "", children: [
            TextSpan(
                text: "Report ",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            TextSpan(
                text: "Your",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    decoration: TextDecoration.underline)),
            TextSpan(
                text: " Bansos",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5))
          ])),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/Nh4BNtN.jpeg"),
                    fit: BoxFit.cover)),
            child: BansosList()));
  }
}
