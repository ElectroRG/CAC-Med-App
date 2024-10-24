import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarNormal extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const AppbarNormal({super.key, required this.title, required this.height});

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: height,
        child: CupertinoNavigationBar(


          middle: Align(
            alignment: const Alignment(-1.15, 0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Color(0xFF185A87),
              ),
            ),
          ),
            backgroundColor: const Color(0xFFB9D1EA)
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

