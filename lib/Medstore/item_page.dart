import 'package:cac_med_app/AppBars/appBar_normal.dart';
import 'package:cac_med_app/Medstore/med_shop_page.dart';
import 'package:cac_med_app/components/done_button.dart';
import 'package:flutter/cupertino.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.itemName, required this.url});

  final String itemName;
  final String url;
  final String price = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFB9D1EA),
      navigationBar: AppbarNormal(title: itemName, height: 150),
      child: Center(
        child: Column(
          children: [
            Text(
                itemName
            ),

            Padding(padding: EdgeInsets.all(16)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                url,
                height: 300,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
            DoneButton(
              page: Medshop(),
            )
          ],
        ),
      ),
    );
  }
}
