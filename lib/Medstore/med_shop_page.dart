import 'package:cac_med_app/AppBars/appbarMedShop.dart';
import 'package:cac_med_app/Medstore/item_page.dart';
import 'package:cac_med_app/components/med_Store_item_icons.dart';
import 'package:flutter/cupertino.dart';

class Medshop extends StatefulWidget {
  const Medshop({super.key});

  @override
  State<Medshop> createState() => _MedshopState();
}

class _MedshopState extends State<Medshop> {
  // Create a list of items to reduce repetition
  final List<Map<String, String>> items = [
    {
      'name': 'Tylenol',
      'imageUrl': 'https://medistik.com/cdn/shop/files/Medistik_tyenol_1920x1024.png?v=1724744259',
    },
    {
      'name': 'Ibuprofen',
      'imageUrl': 'https://s3.eu-west-3.amazonaws.com/perrigo.com/perrigo_com_assets/styles/thumbnail_medium/s3/product-images/PQ%20604K4resize.png?VersionId=VVVtEojWi8skBRO7S5f8kNkUQMIaXh1F&itok=r2XuiNbx',
    },
    {
      'name': 'Aleve',
      'imageUrl': 'https://cdn.prod.website-files.com/6371b074f0039479ca60bf9f/642334773ac0c59d19162444_AleveCover.png',
    },
    {
      'name': 'Excedrin',
      'imageUrl': 'https://i-preprod-cf65.ch-static.com/content/dam/cf-consumer-healthcare/bp-excedrin-v2/en_US/products/extra-strength/extra-strength-packshot.png',
    },
    {
      'name': 'Excedrin',
      'imageUrl': 'https://i-preprod-cf65.ch-static.com/content/dam/cf-consumer-healthcare/bp-excedrin-v2/en_US/products/extra-strength/extra-strength-packshot.png',
    },
    {
      'name': 'Excedrin',
      'imageUrl': 'https://i-preprod-cf65.ch-static.com/content/dam/cf-consumer-healthcare/bp-excedrin-v2/en_US/products/extra-strength/extra-strength-packshot.png',
    },

  ];

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = ['Home', 'prescribed', 'over the counter'];

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFB9D1EA),

      // Set the background color to uniform
      navigationBar: Appbar1(
        height: 80,
        dropdownItems: dropdownItems,
        onDropdownChanged: (value) {
          print('Selected item: $value');
        },
        onPressed: () {
          // Handle cart button press
        },
      ),





      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Container(// Ensures the child container has the same background color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                ..._buildItemRows(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build rows of items
  List<Widget> _buildItemRows() {
    List<Widget> rows = [];

    for (int i = 0; i < items.length; i += 2) {
      // Ensure we don't go out of bounds
      if (i + 1 < items.length) {
        rows.add(Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItemIcon(items[i]),
              _buildItemIcon(items[i + 1]),
            ],
          ),
        ));
      } else {
        // Handle the case for an odd number of items
        rows.add(Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItemIcon(items[i]),
              const SizedBox(width: 50), // Empty space for alignment
            ],
          ),
        ));
      }
    }

    return rows;
  }

  // Method to build an individual item icon
  Widget _buildItemIcon(Map<String, String> item) {
    return MedStoreItemIcons(
      name: item['name']!,
      imageUrl: item['imageUrl']!,
      price: '10',
      page: ItemPage(
        itemName: item['name']!,
        url: item['imageUrl']!,
      ),
      fit: BoxFit.cover,
    );
  }
}



