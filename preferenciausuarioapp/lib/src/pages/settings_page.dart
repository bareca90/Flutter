import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);
     static final String routename ='settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Center(
        child: Text('Ajustes Page'),
      ),
    );
  }
}