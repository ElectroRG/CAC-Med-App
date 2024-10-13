import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Chatbot extends StatelessWidget {
  Chatbot({super.key});

  // gemini initialization
  final apiKey = Platform.environment['AIzaSyAI_pfX1CmlHRgaLKWI8_cfEtQyt9Ngpcs'];
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
      child: Stack(
        children: [
          Positioned(
            left: 40,
            top: 96,
            child: Container(
              width: 321,
              height: 146,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF2374AB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 4,
                  )
                ],
              ),
              child: const Stack(
                children: [
                  Positioned(
                    left: 33,
                    top: 22,
                    child: SizedBox(
                      width: 262,
                      height: 38,
                      child: Text(
                        'Ask me anything!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 29,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0.04,
                          letterSpacing: -0.29,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 72,
                    child: SizedBox(
                      width: 130,
                      height: 47,
                      child: Text(
                        'What does this medication do?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 172,
                    top: 81,
                    child: SizedBox(
                      width: 123,
                      height: 38,
                      child: Text(
                        'What does this medication do?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 776,
            child: Container(
              width: 393,
              height: 76,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Color(0xFF2374AB)),
            ),
          ),
          Positioned(
            left: 321,
            top: 13,
            child: Container(
              width: 53,
              height: 54,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 617,
            child: Container(
              width: 393,
              height: 172,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF9747FF)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      width: 353,
                      height: 56,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 20,
                            top: -1,
                            child: SizedBox(
                              width: 185,
                              height: 39,
                              child: Opacity(
                                opacity: 0.50,
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                    color: Color(0xFF837F7F),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    height: 0.08,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 293,
                            top: 8,
                            child: Opacity(
                              opacity: 0.50,
                              child: Container(
                                width: 35,
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const FlutterLogo(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
    GenerateContentResponse response = await gemini.generateContent([Content.text(input)]);
    return response.text;
  }
}