import 'package:flutter/material.dart';



class RedScreen extends StatelessWidget {
  static final id = '/red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: Text(
            'Bloody Screen'
          ),
        ),
      ),
    );
  }
}
