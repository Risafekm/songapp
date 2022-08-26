import 'package:flutter/material.dart';


class Box3d extends StatelessWidget {
  final child;
  const Box3d({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:Center(
        child:  child,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius:BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(5,5),
              blurRadius: 8,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-5,-5),
              blurRadius: 8,
            ),
          ]
      ),
    );
  }
}
