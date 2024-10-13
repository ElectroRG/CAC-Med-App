import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Appbar1 extends StatelessWidget implements ObstructingPreferredSizeWidget {
  Appbar1({
    super.key,
    required this.height,
    this.onPressed,
    required this.onDropdownChanged,
    required this.dropdownItems, // List of dropdown items (Strings)
  });

  final double height;
  final Function? onPressed;
  final ValueChanged<String> onDropdownChanged; // Callback for dropdown selection
  final List<String> dropdownItems; // List of items for the dropdown

  TextEditingController searchBar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          child: CupertinoNavigationBar(
            backgroundColor: const Color.fromRGBO(103, 150, 198, 100),
            leading: SizedBox(
                width: 50, // or an appropriate value for the button size
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => Container(
                        height: 250,
                        color: CupertinoColors.systemBackground.resolveFrom(context),
                        child: CupertinoPicker(
                          itemExtent: 32.0,
                          onSelectedItemChanged: (int index) {
                            onDropdownChanged(dropdownItems[index]);
                          },
                          children: dropdownItems
                              .map((item) => Center(child: Text(item)))
                              .toList(),
                        ),
                      ),
                    );
                  },
                  child: Icon(CupertinoIcons.bars, color: CupertinoColors.white, size: 40,),
                ),
              ),
            trailing: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: const Icon(
                CupertinoIcons.cart_fill,
                size: 30,
                color: CupertinoColors.white,
              ),
              onPressed: () {
                if (onPressed != null) onPressed!();
              },
            ),
            middle: Text(
              'm Store',
              style: GoogleFonts.eduVicWaNtBeginner(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ),
        // Search bar section below the title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: CupertinoSearchTextField(
            controller: searchBar,
            placeholder: 'Search',
            style: const TextStyle(color: CupertinoColors.black),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}