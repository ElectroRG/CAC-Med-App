import 'package:flutter/cupertino.dart';

class DoneButton extends StatelessWidget {
  DoneButton({super.key, required this.page});

  var page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(103, 150, 198, 100),
          ),
          child: Text('Done',
          style: TextStyle(
            fontSize: 20
          ),),
        ),
      ),
      onTap: () => Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => page)),
    );
  }
}
