import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required String itemName, required String url});

  @override
  State<ItemPage> createState() => _GenerateInfoScreenState();
}

class _GenerateInfoScreenState extends State<ItemPage> {
  String apiKey = "AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcsy";
  late GenerativeModel model;
  late String responseData;
  late bool isLoading;

  // Predefined prompt set by the programmer
  final String predefinedPrompt = "Explain the principles of quantum mechanics in simple terms.";

  @override
  void initState() {
    super.initState();
    model = GenerativeModel(
      model: 'gemini-1.5-pro-002',
      apiKey: apiKey,
    );
    responseData = "";
    setLoading(false);
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<void> generateContent() async {
    final content = [Content.text(predefinedPrompt)];
    setLoading(true);
    try {
      final response = await model.generateContent(content);
      if (response.candidates.isNotEmpty) {
        responseData = response.text ?? "";
        setState(() {});
      } else {
        responseData = "No data found!";
      }
    } catch (error) {
      responseData = "Something went wrong!";
    }
    setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generative AI"),
        centerTitle: true,
      ),
      body: _buildScreen(context),
    );
  }

  Widget _buildScreen(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateContent,
              child: const Text("Generate Answer"),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    responseData.isEmpty
                        ? "No data found"
                        : responseData,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








