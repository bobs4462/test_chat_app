import 'package:flutter/material.dart';
import 'package:lcc/widgets/channel_tile.dart';
import 'package:lcc/data/channels.dart';

class ChannelsScreen extends StatelessWidget {
  static final String route = '/channels';
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channels'),
        elevation: 3,
      ),
      body: Container(
        height: 500,
        child: ListView.builder(
            itemBuilder: (ctx, index) {
              return ChannelTile(CHANNELS[index]);
            },
            itemCount: CHANNELS.length),
      ),
    );
  }
}
