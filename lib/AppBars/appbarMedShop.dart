import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Needed for animations
import 'package:google_fonts/google_fonts.dart';

class Appbar1 extends StatefulWidget implements ObstructingPreferredSizeWidget {
  Appbar1({
    super.key,
    required this.height,
    this.onPressed,
    required this.onDropdownChanged,
    required this.dropdownItems, // List of dropdown items (Strings)
  });

  final double height;
  final Function? onPressed;
  final ValueChanged<String>
      onDropdownChanged; // Callback for dropdown selection
  final List<String> dropdownItems; // List of items for the dropdown

  @override
  _Appbar1State createState() => _Appbar1State();

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}

class _Appbar1State extends State<Appbar1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  TextEditingController searchBar = TextEditingController();

  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);
  }

  void _toggleDrawer() {
    setState(() {
      if (isDrawerOpen) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (isDrawerOpen) {
              _toggleDrawer(); // Close drawer on tap outside
            }
          },
          child: Column(
            children: [
              Container(
                height: widget.height,
                child: CupertinoNavigationBar(
                  backgroundColor: const Color.fromRGBO(103, 150, 198, 100),
                  leading: SizedBox(
                    width: 50,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: _toggleDrawer, // Open the custom side drawer
                      child: Icon(
                        CupertinoIcons.bars,
                        color: CupertinoColors.white,
                        size: 40,
                      ),
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
                      if (widget.onPressed != null) widget.onPressed!();
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: CupertinoSearchTextField(
                  controller: searchBar,
                  placeholder: 'Search',
                  style: const TextStyle(color: CupertinoColors.black),
                ),
              ),
            ],
          ),
        ),
        // Custom side drawer
        SlideTransition(
          position: _offsetAnimation,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 900,
              width: 250,
              color: CupertinoColors.systemGrey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60), // Adjust for padding
                  CupertinoButton(
                    child: Text('Menu Item 1'),
                    onPressed: () {
                      widget.onDropdownChanged(widget.dropdownItems[0]);
                    },
                  ),
                  CupertinoButton(
                    child: Text('Menu Item 2'),
                    onPressed: () {
                      widget.onDropdownChanged(widget.dropdownItems[1]);
                    },
                  ),
                  // Add more menu items as needed
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
