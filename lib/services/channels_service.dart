import 'package:lcc/data/channels.dart';
import 'package:lcc/models/channel.dart';

class ChannelsService {
  static final ChannelsService _service = ChannelsService._internal();
  factory ChannelsService() {
    return _service;
  }
  ChannelsService._internal();

  Channel getChannelById(int channelId) {
    return channels.singleWhere((c) => c.id == channelId);
  }

  List<Channel> getChannels() {
    return channels;
  }
}
