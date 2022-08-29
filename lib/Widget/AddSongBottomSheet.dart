import 'package:flutter/material.dart';

class AddSongFiled extends StatelessWidget {
  const AddSongFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return  Container(
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
                const SizedBox(height: 20,),

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
  }
}

