import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
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
        color: Color.fromRGBO(218, 237, 255, 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name,
              style: TextStyle(
                color: CupertinoColors.black
              ),),
            ),
            // Image.asset(image_url,
            // height: 50,
            // width: 100,
            // fit: BoxFit.cover,),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Price: '),
            // )
          ],
        ),
      ),
    );
  }
}