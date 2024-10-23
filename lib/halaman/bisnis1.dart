import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Page'),
        backgroundColor: Color.fromARGB(255, 236, 106, 26),
      ),
      body: Center(
        child:
            Text('This is the Business Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
