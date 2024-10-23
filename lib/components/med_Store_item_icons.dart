import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class MedStoreItemIcons extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final String price;
  final Widget page;
  final BoxFit fit; // Add fit parameter for customizing image fit

  MedStoreItemIcons({
    super.key,
    required this.name,
    this.imageUrl,
    required this.page,
    required this.price,
    this.fit = BoxFit.fill, // Default to BoxFit.fill if not provided
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(218, 237, 255, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  height: 122,
                  width: 170 - 30,
                  fit: fit, // Use the fit parameter to customize image fit
                ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.black,
                    decoration: TextDecoration.none,
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
          CupertinoPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
