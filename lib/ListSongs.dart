import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                return Container(
                  height: 600,
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child:Column(
                          children: [
                            const SizedBox(height: 20,),

                            const Text('A d d  S o n g  T o  P l a y L i s t',style: TextStyle(fontSize: 24,color: Colors.blue),),

                            const SizedBox(height: 20,),

                            Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                              child:  TextFormField(
                                controller: _usernameController,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Song cannot be empty";
                                  }else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Song name',
                                  hintStyle: TextStyle(fontSize: 18,color: Colors.blue),

                                ),
                              ),
                            ),
                            SizedBox(height: 20,),

                            Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                              child:  TextFormField(
                                controller: _passwordController,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "textField cannot be empty";
                                  }else{
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Song Url',
                                  hintStyle: TextStyle(fontSize: 18,color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       height: 50,
                       width: 150,
                       decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: ElevatedButton(
                         onPressed: (){},
                         child:const Text('Save'),
                         style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Colors.transparent),
                           elevation: MaterialStateProperty.all(0),
                         ),
                       ),
                     ),

                     Container(
                       height: 50,
                       width: 150,
                       decoration: BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: ElevatedButton(
                         onPressed: (){
                           Navigator.of(context).pop();
                         },
                         child:const Text('Cancel'),
                         style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Colors.transparent),
                           elevation: MaterialStateProperty.all(0),
                         ),
                       ),
                     ),
                   ],
                 ),
                    ],
                  ),
                );
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


