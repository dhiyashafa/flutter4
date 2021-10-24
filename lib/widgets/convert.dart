import 'package:flutter/material.dart';

class Conv extends StatelessWidget {
  const Conv({Key? key, required this.convr}) : super(key: key);

  final Function convr;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue, // background
        textColor: Colors.white, // foreground
        onPressed: () {
          this.convr();
        },
        child: Text('Konversi Suhu'),
      ),
    );
  }
}
