import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:songapp/AudioPage.dart';
import 'package:songapp/ListSongs.dart';


Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SongList() ,
    );
  }
}
