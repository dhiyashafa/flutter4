import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/convert.dart';
import 'widgets/input.dart';
import 'widgets/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel berubah
  double _inputUSer = 0;
  double _kelvin = 0;
  double _reamur = 0;
  // double _farenheit = 0;
  final inputController = TextEditingController();

  void hitungSuhu() {
    setState(() {
      _inputUSer = double.parse(inputController.text);
      _kelvin = _inputUSer + 273;
      _reamur = (4 / 5) * _inputUSer;
      // _farenheit = (9 / 5) * _inputUSer + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Input(inputController: inputController),
              Result(kelvin: _kelvin, reamur: _reamur),
              Conv(
                convr: hitungSuhu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}