import 'package:flutter/material.dart';
import 'package:lcc/screens/channels.dart';
import 'package:lcc/screens/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChannelsScreen(),
      routes: {
        ChannelsScreen.route: (ctx) => ChannelsScreen(),
        MessageScreen.route: (ctx) => MessageScreen(),
      },
    );
  }
}
