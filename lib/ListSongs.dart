import 'package:flutter/material.dart';
import 'package:songapp/AddSongBottomSheet.dart';
import 'package:songapp/AudioPage.dart';
import 'package:songapp/Widget/BlackBox.dart';
import 'package:songapp/Widget/Box3d.dart';

class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool changeButton = false;

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
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'P L A Y  L I S T',
            style: TextStyle(
                fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal
            ),
          ),
        ),

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

      body: SafeArea(
        child:GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AudioPage()));
          },
          child:  ListView.separated(
            itemCount: 40,
            itemBuilder: (context, index) {
              return ListTile(
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
                  'Name $index',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                subtitle: const Text(
                  'Artists ',
                  style: TextStyle(
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
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ),

    );
  }

}


