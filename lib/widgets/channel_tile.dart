import 'package:flutter/material.dart';
import 'package:lcc/models/channel.dart';
import 'package:lcc/screens/message.dart';
import 'package:lcc/services/messages_service.dart';
import 'package:lcc/widgets/rich_text.dart';

class ChannelTile extends StatelessWidget {
  final Channel channel;
  ChannelTile(this.channel);
  @override
  Widget build(BuildContext ctx) {
    return InkWell(
      onTap: () {
        Navigator.of(ctx).pushNamed(
          MessageScreen.route,
          arguments: {
            'channelTitle': channel.title,
            'channelId': channel.id,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(ctx).primaryColor),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(channel.emoji),
            backgroundColor: Colors.blueGrey,
          ),
          title: Text(channel.title),
          subtitle: RichTextMessage(
            MessagesService().getLastChannelMessage(channel.id),
          ),
        ),
      ),
    );
  }
}
