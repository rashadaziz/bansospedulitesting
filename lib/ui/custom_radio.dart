import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final String? initialGroupValue;
  final String radioOneTitle;
  final String radioOneValue;
  final String radioTwoTitle;
  final String radioTwoValue;
  final String radioThreeTitle;
  final String radioThreeValue;
  final double borderRadius;

  const CustomRadio(
      {Key? key,
      this.initialGroupValue,
      required this.radioOneTitle,
      required this.radioOneValue,
      required this.radioTwoTitle,
      required this.radioTwoValue,
      required this.radioThreeTitle,
      required this.radioThreeValue,
      required this.borderRadius})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  String? groupValue;

  @override
  void initState() {
    groupValue = widget.initialGroupValue;
    super.initState();
  }

  void valueChanged(String value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    if (groupValue == null) {
      return "null";
    }
    return groupValue!;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))),
      margin: EdgeInsets.only(top: 10, left: 10),
      width: size.width * 0.8,
      height: 40,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () => {valueChanged(widget.radioOneValue)},
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: groupValue == widget.radioOneValue
                      ? Colors.blue
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.borderRadius),
                      bottomLeft: Radius.circular(widget.borderRadius)),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
                child: Center(
                    child: Text(widget.radioOneTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: groupValue == widget.radioOneValue
                                ? Colors.white
                                : Colors.blue,
                            fontSize: size.width * 0.035))),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () => {valueChanged(widget.radioTwoValue)},
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: groupValue == widget.radioTwoValue
                      ? Colors.blue
                      : Colors.white,
                  border: const Border(
                      top: BorderSide(width: 1.5, color: Colors.blue),
                      bottom: BorderSide(width: 1.5, color: Colors.blue)),
                ),
                child: Center(
                    child: Text(widget.radioTwoTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: groupValue == widget.radioTwoValue
                                ? Colors.white
                                : Colors.blue,
                            fontSize: size.width * 0.035))),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () => {valueChanged(widget.radioThreeValue)},
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: groupValue == widget.radioThreeValue
                      ? Colors.blue
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(widget.borderRadius),
                      bottomRight: Radius.circular(widget.borderRadius)),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
                child: Center(
                    child: Text(widget.radioThreeTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: groupValue == widget.radioThreeValue
                                ? Colors.white
                                : Colors.blue,
                            fontSize: size.width * 0.035))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
