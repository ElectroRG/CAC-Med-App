import 'package:cac_med_app/AppBars/appbarMedShop.dart';
// import 'package:cac_med_app/Medstore/cart.dart';
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MedStoreItemIcons(
                        name: 'name',
                        imageUrl: 'assets/Medical Cartoon Vector.jpg',
                        page: ItemPage(itemName: 'name', url: 'assets/Medical Cartoon Vector.jpg'),
                      ),
                      // MedStoreItemIcons(name: 'p'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
