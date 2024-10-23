import 'package:cac_med_app/AppBars/appbarMedShop.dart';
//import 'package:cac_med_app/Medstore/cart.dart';
import 'package:cac_med_app/Medstore/item_page.dart';
import 'package:cac_med_app/components/med_Store_item_icons.dart';
import 'package:flutter/cupertino.dart';

class Medshop extends StatefulWidget {
  const Medshop({super.key});

  @override
  State<Medshop> createState() => _MedshopState();
}

class _MedshopState extends State<Medshop> {
  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = ['Home', 'prescribed', 'over the counter'];

    return CupertinoPageScaffold(
      navigationBar: Appbar1(
        height: 150,
        dropdownItems: dropdownItems, // Provide dropdown items
        onDropdownChanged: (value) {
          // Handle dropdown change
          print('Selected item: $value');
        },
        onPressed: () {
          // Handle cart button press
        },
      ),
      backgroundColor: const Color.fromRGBO(185, 209, 234, 1),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MedStoreItemIcons(
                      name: 'Tylenol',
                      imageUrl: 'https://medistik.com/cdn/shop/files/Medistik_tyenol_1920x1024.png?v=1724744259',
                      price: '10',
                      page: ItemPage(
                        itemName: 'Tylenol',
                        url: 'https://medistik.com/cdn/shop/files/Medistik_tyenol_1920x1024.png?v=1724744259',
                      ),
                      fit: BoxFit.cover,
                    ),
                    MedStoreItemIcons(
                      name: 'Ibuprofen',
                      imageUrl: 'https://s3.eu-west-3.amazonaws.com/perrigo.com/perrigo_com_assets/styles/thumbnail_medium/s3/product-images/PQ%20604K4resize.png?VersionId=VVVtEojWi8skBRO7S5f8kNkUQMIaXh1F&itok=r2XuiNbx',
                      price: '10',
                      page: ItemPage(
                        itemName: 'Ibuprofen',
                        url: 'https://s3.eu-west-3.amazonaws.com/perrigo.com/perrigo_com_assets/styles/thumbnail_medium/s3/product-images/PQ%20604K4resize.png?VersionId=VVVtEojWi8skBRO7S5f8kNkUQMIaXh1F&itok=r2XuiNbx',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MedStoreItemIcons(
                      name: 'Aleve',
                      imageUrl: 'https://cdn.prod.website-files.com/6371b074f0039479ca60bf9f/642334773ac0c59d19162444_AleveCover.png',
                      price: '10',
                      page: ItemPage(
                        itemName: 'Aleve',
                        url: 'https://cdn.prod.website-files.com/6371b074f0039479ca60bf9f/642334773ac0c59d19162444_AleveCover.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    MedStoreItemIcons(
                      name: 'Excedrin',
                      imageUrl: 'https://i-preprod-cf65.ch-static.com/content/dam/cf-consumer-healthcare/bp-excedrin-v2/en_US/products/extra-strength/extra-strength-packshot.png',
                      price: '10',
                      page: ItemPage(
                        itemName: 'Excedrin',
                        url: 'https://i-preprod-cf65.ch-static.com/content/dam/cf-consumer-healthcare/bp-excedrin-v2/en_US/products/extra-strength/extra-strength-packshot.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
