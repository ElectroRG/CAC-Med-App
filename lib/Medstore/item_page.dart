import 'package:cac_med_app/AppBars/appBar_normal.dart';
import 'package:cac_med_app/Medstore/med_shop_page.dart';
import 'package:cac_med_app/components/done_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:firebase_core/firebase_core.dart';

class ItemPage extends StatefulWidget {
  ItemPage({super.key, required this.itemName, required this.url});

  final String itemName;
  final String url;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final String price = "";
  late final model;
  late final Stream response;
  List<String> generatedTexts = []; // To store the generated texts

  @override
  void initState() {
    super.initState();
    _initializeModel();
  }

  Future<void> _initializeModel() async {
    await Firebase.initializeApp(); // Ensure Firebase is initialized
    model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

    // Provide a prompt that contains text
    final prompt = [Content.text('Write a story about a magic backpack.')];

    // To stream generated text output, call generateContentStream with the text input
    response = model.generateContentStream(prompt);

    // Stream the generated content
    await for (final chunk in response) {
      setState(() {
        generatedTexts.add(chunk.text); // Add the generated text to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFB9D1EA),
      navigationBar: AppbarNormal(title: widget.itemName, height: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi',
              style: TextStyle(
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 25,
                decoration: TextDecoration.none,
                color: Color(0xFF185A87),
              ),
            ),
            // Display the generated texts
            for (var text in generatedTexts)
              Text(
                text,
                style: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
                  fontSize: 16,
                  color: Color(0xFF185A87),
                ),
              ),
          ],
        ),
      ),
    );
  }
}











