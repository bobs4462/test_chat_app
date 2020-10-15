import 'package:flutter/material.dart';
import 'package:lcc/models/message.dart';
import 'package:lcc/services/messages_service.dart';
import 'package:lcc/services/configuration.dart';

class TextInput extends StatelessWidget {
  final _textController = TextEditingController();
  final appBarHeight;
  final Function onSubmit;
  final int channelId;
  final ScrollController scrollController;
  TextInput({
    @required this.onSubmit,
    @required this.channelId,
    @required this.scrollController,
    @required this.appBarHeight,
  });
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: (Configuration().getScreenHeight(ctx) - appBarHeight) * 0.1,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: Configuration().getScreenWidth(ctx) * 0.9,
              child: TextField(
                onSubmitted: (content) {
                  Message msg = Message(
                      id: MessagesService().getMaxMessageId() + 1,
                      content: content,
                      channelId: channelId,
                      user: 'John Doe');
                  onSubmit(msg);
                },
                onTap: () {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.edit),
                  labelText: 'Message',
                ),
                controller: _textController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
