import 'package:flutter/material.dart';
import 'package:lcc/data/messages.dart';
import 'package:lcc/widgets/messages_list.dart';

class MessageScreen extends StatefulWidget {
  static final String route = '/message';
  @override
  State<MessageScreen> createState() => _MessageScreen();
}

class _MessageScreen extends State<MessageScreen> {
  @override
  Widget build(BuildContext ctx) {
    var args = ModalRoute.of(ctx).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['channelTitle']),
      ),
      body: MessagesList(MESSAGES),
    );
  }
}
