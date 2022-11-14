import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:songapp/Widget/BlackBox.dart';
import 'package:songapp/Widget/Box3d.dart';


class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {

  bool isFavarite = false;
  bool isPlaylist = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isPause = false;


  Duration position = new Duration();
  Duration musiclength = new Duration();

  final _audioQuery = OnAudioQuery();



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
                    children:  const [
                      Text('Aalum thee naalam',style: TextStyle(fontSize: 20,letterSpacing: 2,fontStyle: FontStyle.italic),),
                      SizedBox(height: 5,),
                      Text('akhil j chand | jana gana mana |',style: TextStyle(fontSize: 18,color: Colors.black54,letterSpacing: 1,fontStyle: FontStyle.italic),),
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
                      if(isShuffle == false){
                        isShuffle = true;
                      }else{
                        isShuffle = false;
                      }
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
                      if(isRepeat == false){
                        isRepeat = true;
                      }else{
                        isRepeat = false;
                      }
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
                    // setState(() {
                    //   if(isPlaylist == false){
                    //     isPlaylist = true;
                    //   }else{
                    //     isPlaylist=false;
                    //   }
                    // });
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
                      if(isFavarite == false){
                        isFavarite = true;
                      }else{
                        isFavarite=false;
                      }
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

            const SizedBox(height: 50,),

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
                            if(isPause==false){
                              isPause=true;
                            }else{
                              isPause=false;
                            }
                          });
                        },
                        child: SizedBox(
                          height: 70,
                          width: 90,
                          child: BlackBox(
                            child:isPause ? const Icon(Icons.play_arrow,size: 28,color: Colors.red):const Icon(Icons.pause,size: 30,color: Colors.black),
                          ),
                        ),
                      ),flex: 2,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
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
