import 'package:flutter/material.dart';
import 'package:lcc/data/messages.dart';
import 'package:lcc/models/message.dart';
import 'package:lcc/widgets/messages_list.dart';
import 'package:lcc/widgets/text_input.dart';
import 'package:lcc/services/messages_service.dart';
import 'package:lcc/services/channels_service.dart';

class MessageScreen extends StatefulWidget {
  static final String route = '/message';
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var args;
  void _messageAdd(Message msg) {
    var channel = ChannelsService().getChannelById(
      args['channelId'],
    );
    setState(() {
      messages.add(msg);
      channel.lastMessageId = msg.id;
    });
  }

  final _controller = ScrollController();
  @override
  Widget build(BuildContext ctx) {
    args = ModalRoute.of(context).settings.arguments as Map;
    var appBar = AppBar(title: Text(args['channelTitle']));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MessagesList(
              messagesList:
                  MessagesService().getChannelMessages(args['channelId']),
              controller: _controller,
              appBarHeight: appBar.preferredSize.height,
            ),
            TextInput(
              scrollController: _controller,
              appBarHeight: appBar.preferredSize.height,
              onSubmit: _messageAdd,
              channelId: args['channelId'],
            ),
          ],
        ),
      ),
    );
  }
}
