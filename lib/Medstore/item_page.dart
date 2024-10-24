import 'package:cac_med_app/AppBars/appBar_normal.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:firebase_core/firebase_core.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.itemName, required this.url});

  final String itemName;
  final String url;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late final GenerativeModel model;
  List<String> generatedTexts = []; // To store generated texts
  bool isLoading = true; // Loading state for the AI response

  @override
  void initState() {
    super.initState();
    _initializeModel();
  }

  Future<void> _initializeModel() async {
    await Firebase.initializeApp(); // Ensure Firebase is initialized
    model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

    // Provide a prompt
    final prompt = [Content.text('Write a story about a magic backpack.')];

    // Start streaming the generated content
    try {
      final response = model.generateContentStream(prompt);
      await for (final chunk in response) {
        setState(() {
          generatedTexts.add(chunk.text ?? "");
        });
      }
    } catch (e) {
      // Handle any errors that may occur during streaming
      setState(() {
        generatedTexts.add('Error generating content: $e');
      });
    } finally {
      setState(() {
        isLoading = false; // Stop the loading spinner once content is fetched
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFB9D1EA),
      navigationBar: AppbarNormal(title: widget.itemName, height: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display header text
            Text(
              'Hi',
              style: TextStyle(
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 25,
                decoration: TextDecoration.none,
                color: const Color(0xFF185A87),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing
            // Show loading indicator while waiting for response
            if (isLoading)
              const CupertinoActivityIndicator(radius: 20)
            else if (generatedTexts.isNotEmpty)
            // Display the generated text once it is ready
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: generatedTexts.map((text) {
                    return Text(
                      text,
                      style: TextStyle(
                        fontFamily: GoogleFonts.comfortaa().fontFamily,
                        fontSize: 16,
                        color: const Color(0xFF185A87),
                      ),
                      textAlign: TextAlign.center,
                    );
                  }).toList(),
                ),
              )
            else
              const Text('No content generated.'),
          ],
        ),
      ),
    );
  }
}
