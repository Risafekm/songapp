import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:songapp/Widget/AddSongBottomSheet.dart';
import 'package:songapp/AudioPage.dart';
import 'package:songapp/Widget/BlackBox.dart';
import 'package:songapp/Widget/Box3d.dart';
import 'package:songapp/Widget/Search.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:just_audio/just_audio.dart';


class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool changeButton = false;
  final _audioQuery = OnAudioQuery();
   final AudioPlayer _audioPlayer = AudioPlayer();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission(){
    Permission.storage.request();
  }

  playSong(String ? uri){
    try{
      _audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!),),);
      _audioPlayer.play();

    }on Exception {
      log('error parsing song');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.grey[300],

        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'P L A Y  L I S T',
            style: TextStyle(
                fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal
            ),
          ),
        ),

        // leading: const Icon(Icons.music_note,size: 26,color: Colors.black,),

        leading:GestureDetector(
          onTap: (){
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return const AddSongFiled();
              },
            );
          },
          child:  const BlackBox(child: Icon(Icons.music_note, color: Colors.black,
            size: 26,),),
        ),

        actions: [

          Padding(padding: const EdgeInsets.only(right: 5,bottom: 3,top: 3),
            child: GestureDetector(
              onTap: () {
               showSearch(context: context, delegate:Search());
              },
              child: const SizedBox(
                height: 60,
                width: 70,
                child: Box3d(
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
          sortType: null,
          orderType: OrderType.DESC_OR_GREATER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, item){
          if(item.data == null){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(item.data!.isEmpty){
            return Text("No Songs Found");
          }
          return SafeArea(
            child: ListView.builder(
                itemCount: item.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                    //  playSong(item.data![index].uri);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AudioPage(songModel: item.data![index],),),);
                    },
                    leading: SizedBox(
                      height: 70,
                      width: 60,
                      child: Box3d(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/Jana-Gana-Mana.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      item.data![index].displayNameWOExt,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    subtitle:  Text(
                      item.data![index].artist.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 1),
                    ),
                    trailing:IconButton(
                      onPressed: (){
                        print('Clicked Mrevert');
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        size: 22,
                      ),
                    ),
                  );
                },
                // separatorBuilder: (BuildContext context, int index) {
                //   return const Divider();
                // },
              ),
          );
        },
      ),
    );
  }

}


