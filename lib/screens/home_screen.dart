import 'package:flutter/material.dart';
import 'package:flutter_application_uh1/widgets/score_input.dart.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode themeMode;

  HomeScreen({required this.onThemeChanged, required this.themeMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _result = '';
  bool _isDarkMode = true;

  void _updateResult(String result) {
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai'),
        backgroundColor: Colors.blue,
        actions: [Icon(Icons.light_mode),
          Switch(
            value: widget.themeMode == ThemeMode.dark,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
              widget.onThemeChanged(value);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ScoreInput(onResult: _updateResult),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}