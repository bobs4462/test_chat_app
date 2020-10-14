import 'package:flutter/material.dart';
import 'package:lcc/models/message.dart';

class MessagesList extends StatelessWidget {
  final List<Message> messagesList;
  MessagesList(this.messagesList);
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 1,
            child: ListTile(
              title: Text(messagesList[index].user),
              subtitle: Text(
                messagesList[index].content,
              ),
            ),
          );
        },
        itemCount: messagesList.length,
      ),
    );
  }
}
