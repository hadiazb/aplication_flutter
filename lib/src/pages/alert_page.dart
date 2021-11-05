import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      floatingActionButton: const FloatingActionButton(
          child: Icon(Icons.ac_unit_sharp), onPressed: null),
    );
  }
}
