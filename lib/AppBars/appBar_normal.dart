import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarNormal extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const AppbarNormal({super.key, required this.title, required this.height});
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: SizedBox(
        height: height,
        child: CupertinoNavigationBar(
          middle: Align(
            alignment: const Alignment(-0.7, 0),
            child: Text(
              title,
              style: GoogleFonts.eduVicWaNtBeginner(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white),
            ),
          ),
          backgroundColor:
            const Color.fromRGBO(103, 150, 198, 100),
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
