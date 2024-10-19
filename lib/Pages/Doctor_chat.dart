import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class DoctorChat extends StatefulWidget {
  DoctorChat({super.key});

  @override
  State<DoctorChat> createState() => _ChatbotState();
}

class _ChatbotState extends State<DoctorChat> {
  // gemini initialization

  ChatUser currentUser = ChatUser(id: '0', firstName: 'You');

  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB9D1EA),
        title: Text("Chat"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      backgroundColor: Color(0xFFB9D1EA),
      body: _builUI(),
    );
  }

  Widget _builUI() {
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
  }
}
