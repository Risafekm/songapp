import 'package:flutter/material.dart';
import 'package:songapp/AudioPage.dart';
import 'package:songapp/Widget/Box3d.dart';

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query='';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon:const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Results();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Results();
  }
  }


  class Results extends StatefulWidget {
    const Results({Key? key}) : super(key: key);

    @override
    _ResultsState createState() => _ResultsState();
  }

  class _ResultsState extends State<Results> {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child:GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  const AudioPage()));
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
      );
    }
  }

