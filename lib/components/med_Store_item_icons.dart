import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedStoreItemIcons extends StatelessWidget {
  MedStoreItemIcons(
      {super.key, required this.name, this.imageUrl, required this.page});
  final String name;
  final String? imageUrl;
  var page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          color: Color.fromRGBO(218, 237, 255, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              if (imageUrl !=
                  null) // To ensure imageUrl is not null before displaying the image
                Image.asset(
                  imageUrl!,
                  height: 100,
                  width: 170 - 30,
                  fit: BoxFit.cover,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Price: ',
                  style: TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => page)
        );
      },
    );
  }
}
