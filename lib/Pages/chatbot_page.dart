import 'dart:io';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final apiKey = Platform.environment['AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcs'];

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
      backgroundColor: const Color(0xFFB9D1EA),

      body: Stack(
        children: [
          _buildUI(),


          Positioned(
            top: 80, // Adjust 'top' value to control vertical position
            left: 30, // Adjust 'left' value to control horizontal position
            child: Text(
              'ChatBot',
              style: TextStyle(
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Color(0xFF185A87),
              ),
            ),
          ),



          Positioned(
            top: 70,
            right: 20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: const Color(0xFF185A87),
                  width: 4,
                ),
                color: Theme.of(context)
                    .colorScheme
                    .background
                    .withOpacity(0.5),
                boxShadow: [
                  const BoxShadow(
                    color: Color(0xFF185A87),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser?.photoURL ??
                          "https://example.com/default-profile.png",
                    ),
                    onBackgroundImageError: (_, __) {
                      print("Failed to load profile picture.");
                    },
                    child: FirebaseAuth.instance.currentUser?.photoURL == null
                        ? const Icon(Icons.person, size: 40)
                        : null,
                  ),
                ],
              ),
            ),
          ),






        ],
      ),
    );
  }

  Future<String?> getResponse(String input) async {
    GenerateContentResponse response =
    await gemini.generateContent([Content.text(input)]);
    return response.text;
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
      messageOptions: const MessageOptions(),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;

      gemini.generateContentStream([Content.text(question)]).listen(
              (GenerateContentResponse event) {
            String responseText = (event.text).toString();

            ChatMessage geminiResponse = ChatMessage(
              user: geminiUser,
              text: responseText,
              createdAt: DateTime.now(),
            );

            setState(() {
              messages = [geminiResponse, ...messages];
            });
          });
    } catch (e) {
      print(e);
    }
  }
}

