import 'package:flutter/cupertino.dart';

class MedStoreItemIcons extends StatelessWidget{
  MedStoreItemIcons({super.key, required this.name, this.image_url});
  final String name;
  var image_url;


  @override
  Widget build(BuildContext){
    return Container(
      height: 200,
      width: 170,
      decoration: BoxDecoration(
        color: Color.fromRGBO(243, 244, 245, 1),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}