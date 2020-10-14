import 'package:lcc/data/messages.dart';

class Message {
  final int id;
  final String content;
  final int channelId;
  final String user;

  const Message({this.id, this.content, this.channelId, this.user});
}

class MessagesService {
  static String getMessageText(int id) {
    return MESSAGES.singleWhere((m) => m.id == id).content;
  }
}
