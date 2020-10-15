import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lcc/models/message.dart';
import 'package:lcc/services/configuration.dart';
import 'package:lcc/widgets/rich_text.dart';

class MessagesList extends StatelessWidget {
  final List<Message> messagesList;
  final double appBarHeight;
  MessagesList({this.messagesList, this.controller, this.appBarHeight});
  final controller;
  @override
  Widget build(BuildContext ctx) {
    Timer(Duration(milliseconds: 500), () {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    var height = Configuration().getScreenHeight(ctx);
    return Container(
      height: (height - appBarHeight) * 0.89,
      child: ListView.builder(
        // reverse: true,
        controller: controller,
        // shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Align(
            alignment:
                index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Card(
                elevation: 1,
                child: Container(
                  width: Configuration().getScreenWidth(ctx) * 0.6,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    title: Text(messagesList[index].user),
                    subtitle: RichTextMessage(
                      messagesList[index].content,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: messagesList.length,
      ),
    );
  }
}
