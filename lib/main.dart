import 'package:flutter/material.dart';
import 'package:localeventsapp/ui/homepage/home_page.dart';

void main() => runApp(LocalEventsApp());

class LocalEventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFF4700),
      ),
      home: HomePage(),
    );
  }
}
