import 'package:flutter/material.dart';
import 'package:lcc/services/channels_service.dart';
import 'package:lcc/services/configuration.dart';
import 'package:lcc/widgets/channel_tile.dart';

class ChannelsScreen extends StatelessWidget {
  static final String route = '/channels';
  final channels = ChannelsService().getChannels();
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channels'),
        elevation: 3,
      ),
      body: Container(
        height: Configuration().getScreenHeight(ctx),
        child: ListView.builder(
            itemBuilder: (ctx, index) {
              return ChannelTile(channels[index]);
            },
            itemCount: channels.length),
      ),
    );
  }
}
