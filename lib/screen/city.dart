import 'package:easy_dialogs/easy_dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<String> _ringTones = [
    'None',
    'Callisto',
    'Ganymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
    'Jungle Gym',
    'Ukulele',
    'Snowflakes',
  ];



  String _ringTone = "None";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: _openRingtoneDialog,
            title: Text('Ringtone'),
            subtitle: Text(_ringTone),
            leading: Icon(Icons.music_note),
          ),


        ],
      ),
    );
  }

  _openRingtoneDialog() {
    showDialog(
        context: context,
        builder: (context) => SingleChoiceConfirmationDialog<String>(
            title: Text('Phone ringtone'),
            initialValue: _ringTone,
            items: _ringTones,
            onSelected: _onSelected,
            onSubmitted: _onSubmitted));
  }



  void _onSelected(String value) {
    print('Selected $value');
    setState(() {
      _ringTone = value;
    });
  }

  void _onSubmitted(String value) {
    print('Submitted $value');
    setState(() {
      _ringTone = value;
    });
  }
}