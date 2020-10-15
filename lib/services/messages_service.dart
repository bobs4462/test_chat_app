import 'package:lcc/data/messages.dart';
import 'package:lcc/models/message.dart';

class MessagesService {
  static final MessagesService _service = MessagesService._internal();

  factory MessagesService() {
    return _service;
  }

  MessagesService._internal();

  List<Message> getChannelMessages(int channelId) {
    return messages.where((m) => m.channelId == channelId).toList();
  }

  String getMessageById(int messageId) {
    return messages.singleWhere((m) => m.id == messageId).content;
  }

  String getLastChannelMessage(int channelId) {
    var filtered = messages.where((m) => m.channelId == channelId);
    if (filtered.isEmpty) {
      return '*Oops!* No messages yet';
    }
    var content = filtered.reduce((m1, m2) {
      if (m1.id > m2.id) {
        return m1;
      } else {
        return m2;
      }
    }).content;
    return content;
  }

  int getMaxMessageId() {
    return messages.reduce(
      (m1, m2) {
        if (m1.id > m2.id) {
          return m1;
        } else {
          return m2;
        }
      },
    ).id;
  }
}
