import 'package:marquee/marquee.dart';
import 'package:flutter/material.dart';
import 'package:songapp/Widget/Box3d.dart';


class SongList extends StatelessWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Column(
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
                    'P L A Y L I S T',
                    style: TextStyle(fontSize: 16,),
                  ),

                  GestureDetector(
                    onTap: (){
                    },
                    child: const SizedBox(
                      height: 70,
                      width: 70,
                      child: Box3d(
                        child: Icon(
                          Icons.search_outlined,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

           Expanded(
               child:ListView.separated(
                 itemCount: 40,
                 itemBuilder: (context,index) {
                   return  ListTile(
                     leading: Container(
                       height: 60,
                       width: 60,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         image: const DecorationImage(
                           image: AssetImage('assets/Jana-Gana-Mana.jpg'),
                         ),
                       ),
                     ),
                     title: Text('Name $index',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),),
                     subtitle: const Text('Artists ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,letterSpacing: 1),),
                   );
                 }, separatorBuilder: (BuildContext context, int index) {
                 return Divider();
               }, ),

           ),

           // Expanded(child:  Marquee(text: 'List of songs ',
           //   style: TextStyle(fontSize: 20),
           //   velocity: 50.0,
           // ),
           // ),
          ],
        ),
      ),
    );

  }
}
// Marquee(text: 'List of songs ',
// style: TextStyle(fontSize: 20),
// velocity: 50.0,
// ),