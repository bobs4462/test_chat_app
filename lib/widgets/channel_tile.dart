import 'package:flutter/material.dart';
import 'package:lcc/models/channel.dart';
import 'package:lcc/screens/message.dart';
import 'package:lcc/models/message.dart';

class ChannelTile extends StatelessWidget {
  final Channel channel;
  ChannelTile(this.channel);
  @override
  Widget build(BuildContext ctx) {
    return InkWell(
      onTap: () {
        Navigator.of(ctx).pushNamed(
          MessageScreen.route,
          arguments: {'channelTitle': channel.title},
        );
      },
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(channel.emoji),
          ),
          title: Text(channel.title),
          subtitle: Text(
            MessagesService.getMessageText(channel.lastMessageId),
          ),
        ),
      ),
    );
  }
}
