import 'package:flutter/cupertino.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.itemName, required this.url});
  final String itemName;
  final String url;
  final String price = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
          child: Column(children: [
        Text(itemName),
        Padding(padding: EdgeInsets.all(16)),
        Image.asset(url,
        height:60,
        width: 50,
        fit: BoxFit.fill,)
      ])),
    );
  }
}
