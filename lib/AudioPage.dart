import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:songapp/Widget/BlackBox.dart';
import 'package:songapp/Widget/Box3d.dart';
import 'package:just_audio/just_audio.dart';


class AudioPage extends StatefulWidget {

  const AudioPage({Key? key,required this.songModel,required this.audioPlayer}) : super(key: key);
   final SongModel songModel;
   final AudioPlayer audioPlayer;

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {

  bool isFavarite = false;
  bool isPlaylist = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isPlaying = false;


  Duration _duration = new Duration();
  Duration _position = new Duration();

  final _audioQuery = OnAudioQuery();
  AudioPlayer _audioPlayer = AudioPlayer();
  
  
  playSong(){
    try{
      widget.audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(widget.songModel.uri!),),);
        widget.audioPlayer.play();
        isPlaying = true;

    }on Exception {
      log('error parsing song');
    }
    widget.audioPlayer.durationStream.listen((d) {
     setState(() {
       _duration = d!;
     });
    });
    widget.audioPlayer.positionStream.listen((p) {
     setState(() {
       _position = p;
     });
    });
  }

  void changeToSec(int seconds){
   Duration duration =Duration(seconds: seconds);
   widget.audioPlayer.seek(duration);
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    playSong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const SizedBox(
                      height: 70,
                      width: 70,
                      child: Box3d(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 26,
                        ),
                      ),
                    ),
                  ),


                  const Text(
                    'P L A Y  M U S I C',
                    style: TextStyle(fontSize: 16),
                  ),


                  GestureDetector(
                    onTap: (){
                    },
                    child: const SizedBox(
                      height: 70,
                      width: 70,
                      child: Box3d(
                        child: Icon(
                          Icons.menu,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                  child:BlackBox(
                    child: Container(
                      height: 280,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image: const DecorationImage(
                          image: AssetImage( 'assets/Jana-Gana-Mana.jpg',),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   [
                      Text(widget.songModel.displayNameWOExt,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 20,letterSpacing: 2,fontStyle: FontStyle.normal),),
                      const SizedBox(height: 5,),
                       Text(widget.songModel.artist.toString(),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 18,color: Colors.black54,letterSpacing: 1,fontStyle: FontStyle.normal),),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isShuffle =! isShuffle;
                    });
                  },
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Box3d(
                      child: Icon(Icons.shuffle,
                        color: isShuffle ? Colors.red : Colors.black87,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                     isRepeat =!isRepeat;
                    });
                  },
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Box3d(
                      child: isRepeat ? const Icon(Icons.repeat_one,color: Colors.blue,) : const Icon(Icons.repeat,color: Colors.black87,),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  // isPlaylist =!isPlaylist;
                  },
                  child:  const SizedBox(
                    height: 60,
                    width: 60,
                    child: Box3d(
                      child: Icon(Icons.playlist_add),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                    isFavarite =! isFavarite;
                    });
                  },
                  child:SizedBox(
                    height: 60,
                    width: 60,
                    child: Box3d(
                      child: Icon(
                        Icons.favorite,
                        color:isFavarite ? Colors.red : Colors.black87 ,
                      ),
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30,),

           Row(
             children: [
               Padding(padding: EdgeInsets.only(left: 10),
              child:  Text(_position.toString().split(".")[0]),
              ),
               Expanded(child:  Slider(
                 onChanged: (value) {
                   setState(() {
                   changeToSec(value.toInt());
                   value = value;
                 });
               },
                 min: Duration(microseconds: 0).inSeconds.toDouble(),
                 max: _duration.inSeconds.toDouble(),
                 value:_position.inSeconds.toDouble(),

               ),),
                Padding(padding: EdgeInsets.only(right: 10),
                 child:  Text(_duration.toString().split(".")[0]),
               ),
             ],
           ),

            Expanded(child:
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: const SizedBox(
                          height: 60,
                          width: 70,
                          child:  BlackBox(
                            child: Icon(Icons.skip_previous,size: 28,color: Colors.black,),
                          ),
                        ),
                      ),),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            if(isPlaying){
                              widget.audioPlayer.pause();
                            }else{
                              widget.audioPlayer.play();
                            }
                            isPlaying =! isPlaying;
                          });
                        },
                        child: SizedBox(
                          height: 70,
                          width: 90,
                          child: BlackBox(
                            child:isPlaying ? const Icon(Icons.pause,size: 28,color: Colors.blue):const Icon(Icons.play_arrow,size: 30,color: Colors.red),
                          ),
                        ),
                      ),flex: 2,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {

                          });
                        },
                        child: const  SizedBox(
                          height: 60,
                          width: 70,
                          child:  BlackBox(
                            child: Icon(Icons.skip_next,size: 28,color: Colors.black,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
