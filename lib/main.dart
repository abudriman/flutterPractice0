import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showStart;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice 0',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: Homepage(),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('StartPage'),
            child: Startpage(
              showStart: _showStart,
              onTapped: _appStartedOnce,
            )
          ),
          if (_showStart == false) MaterialPage(
            key: ValueKey('HomePage'),
            child: Homepage()
          )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _showStart = true;
          });

          return true;
        },
      ),
    );
  }
  void _appStartedOnce(bool state) {
    setState(() {
      _showStart = state;
    });
  }
}


