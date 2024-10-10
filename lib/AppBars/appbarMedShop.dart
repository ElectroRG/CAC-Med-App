import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar1 extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const Appbar1({super.key, required this.height, this.onPressed});
  final double height;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Container(
        height: height,
        child: CupertinoNavigationBar(
          trailing: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: const Icon(
                CupertinoIcons.cart_fill,
                size: 50,
                color: CupertinoColors.white,
              ),
              onPressed: () {
                if (onPressed != null) onPressed!();
              }),
          middle: Align(
            alignment: const Alignment(-0.7, 0),
            child: Text(
              'Medical Store',
              style: GoogleFonts.eduVicWaNtBeginner(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white),
            ),
          ),
          backgroundColor: Color.fromRGBO(103, 150, 198, 100),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
