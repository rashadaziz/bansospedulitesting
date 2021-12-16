import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import './core/bansos_list.dart';

class BansosReportPage extends StatelessWidget {
  const BansosReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "bansospeduli",
          style: TextStyle(
              fontSize: 20, fontStyle: FontStyle.italic, color: Colors.blue),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 80,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                    top: 33,
                    left: size.width * 0.27,
                    child: Text(
                      "Your",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue[400],
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    left: size.width * 0.44,
                    child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                      RotateAnimatedText(" Bansos",
                          textStyle:
                              TextStyle(fontSize: 30, color: Colors.blue)),
                      RotateAnimatedText(" Property",
                          textStyle:
                              TextStyle(fontSize: 30, color: Colors.blue))
                    ]))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BansosList()))
                  },
              child: Text("Report Your Bansos")),
          ElevatedButton(
              onPressed: () => {},
              child: Text("View or Update Previous Reports"))
        ],
      )),
    );
  }
}
