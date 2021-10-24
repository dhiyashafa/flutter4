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
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  // double _farenheit = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";   
  double _result = 0;

  void hitungSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      _kelvin = _inputUser + 273;
      _reamur = (4 / 5) * _inputUser;
      // _farenheit = (9 / 5) * _inputUSer + 32;
    });
  }

  void dropdownOnChanged(changeValue){       
    setState(() {           
      _newValue = changeValue;       
      });   
  } 

void perhitunganSuhu() {     
  setState(() {       
    _inputUser = double.parse(inputController.text);         
    if (_newValue == "Kelvin")         
    _result = _inputUser + 273;       
    else         
    _result = (4 / 5) * _inputUser;     
  });   
} 
  var listItem = ["Kelvin", "Reamur"]; 
  List<String> listHasil = [];

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
              DropdownButton(
                items: listItem.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
                isExpanded: true,
              ),
              Result(
                result: _result,
              ),
              Convert(
                convr: perhitunganSuhu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
