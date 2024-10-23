import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  // gemini initialization
  final apiKey =
      Platform.environment['AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcs'];

  final gemini = GenerativeModel(
    model: 'gemini-1.5-pro-002',
    apiKey: 'AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcs',
    systemInstruction: Content.system(
        'You are a doctor that will diagnose a patient\'s sickness or injury based on their inputted symptoms. Accuracy is crucial and keep responses brief.'),
  );

  ChatUser currentUser = ChatUser(id: '0', firstName: 'You');

  ChatUser geminiUser = ChatUser(id: '1', firstName: 'Gemini');

  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB9D1EA),
      body: _builUI(),
    );
  }

  Future<String?> getResponse(String input) async {
    GenerateContentResponse response =
        await gemini.generateContent([Content.text(input)]);
    return response.text;
  }

  Widget _builUI() {
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;

      // Start listening to the response from Gemini.
      gemini.generateContentStream([Content.text(question)]).listen(
          (GenerateContentResponse event) {
        // Get the response text from Gemini.
        String responseText = (event.text).toString();

        // Create a new ChatMessage for Gemini's response.
        ChatMessage geminiResponse = ChatMessage(
          user: geminiUser,
          text: responseText,
          createdAt: DateTime.now(),
        );

        // Update the UI with Gemini's response.
        setState(() {
          messages = [geminiResponse, ...messages];
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
