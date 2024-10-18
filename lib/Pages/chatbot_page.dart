import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Chatbot extends StatelessWidget {
  Chatbot({super.key});

  // gemini initialization
  final apiKey =
      Platform.environment['AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcs'];
  final gemini = GenerativeModel(
    model: 'gemini-1.5-pro-002',
    apiKey: 'AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcs',
    systemInstruction: Content.system(
        'You are a doctor that will diagnose a patient\'s sickness or injury based on their inputted symptoms. Accuracy is crucial and keep responses brief.'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFB9D1EA)),
    );
  }

  Future<String?> getResponse(String input) async {
    GenerateContentResponse response =
        await gemini.generateContent([Content.text(input)]);
    return response.text;
  }
}
