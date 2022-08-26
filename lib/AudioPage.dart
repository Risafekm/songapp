import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:percent_indicator/percent_indicator.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){},
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child:Box3d(
              child: Image.asset(
                'assets/Jana-Gana-Mana.jpg',
                fit: BoxFit.cover,
              ),
            ),),
                  SizedBox(
                    height: 10,
                  ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child:  Column(
                  children: [
                    Text('Song Name',style: TextStyle(fontSize: 20),),
                    Text('Song Name',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
                ],
              ),

            const SizedBox(height: 20,),

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
                    setState(() {
                      if(isPlaylist == false){
                        isPlaylist = true;
                      }else{
                        isPlaylist=false;
                      }
                    });
                  },
                  child: const SizedBox(
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

            const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: LinearPercentIndicator(
                leading: const Text('0.00'),
                trailing: const Text('4.30'),
                lineHeight: 10,
                percent: 0.6,
                progressColor: Colors.green,
                backgroundColor: Colors.transparent,
              ),
            ),

            const SizedBox(height: 25,),

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
                          height: 90,
                          width: 70,
                          child:Box3d(child: SizedBox(
                            height: 40,
                            width: 70,
                            child:  BlackBox(
                              child: Icon(Icons.skip_previous,size: 28,color: Colors.white,),
                            ),
                          ),),
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
                          height: 90,
                          width: 70,
                          child: Box3d(
                            child: SizedBox(
                              height: 50,
                              width: 120,
                              child: BlackBox(
                                child:isPause ? const Icon(Icons.play_arrow,size: 28,color: Colors.red):const Icon(Icons.pause,size: 30,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),flex: 2,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: const SizedBox(
                          height: 90,
                          width: 70,
                          child:Box3d(child: SizedBox(
                            height: 40,
                            width: 70,
                            child:  BlackBox(
                              child: Icon(Icons.skip_next,size: 28,color: Colors.white,),
                            ),
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
