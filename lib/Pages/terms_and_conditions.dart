import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: October 31, 2026',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            _buildSectionTitle('1. General Information'),
            _buildParagraph(
              'The app offers AI-powered health assistance, a chat service with licensed doctors, and access to a medical shop. The app is not a substitute for professional medical advice. Always consult a qualified healthcare provider for medical conditions and treatments.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('2. AI Health Assistance'),
            _buildParagraph(
              'The AI feature provides general health advice based on symptoms entered by users. This is for informational purposes only and does not offer diagnoses or prescribe treatments.',
            ),
            _buildParagraph(
              'The health information provided by AI should not be considered professional medical advice.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('3. Doctor Chat Service'),
            _buildParagraph(
              'The doctor chat allows users to consult with licensed medical professionals. You are responsible for providing accurate health information during these consultations.',
            ),
            _buildParagraph(
              'This service is not for medical emergencies. For emergencies, please contact your local emergency services immediately.',
            ),
            _buildParagraph(
              'Doctors may not be licensed in your local jurisdiction. You should verify their licensing status before relying on their advice.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('4. Medical Shop'),
            _buildParagraph(
              'The medical shop offers various products, including over-the-counter medicines and health supplies. Availability may vary, and we reserve the right to modify or restrict sales without notice.',
            ),
            _buildParagraph(
              'You are responsible for ensuring that any product purchased is appropriate for your needs. Prescription medications may require valid prescriptions.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('5. User Account'),
            _buildParagraph(
              'You must create an account to use certain features of the app. You are responsible for maintaining the confidentiality of your account details and for any activity under your account.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('6. User Responsibilities'),
            _buildParagraph(
              'You agree to use the app for lawful purposes and in compliance with all applicable laws. You will not misuse or interfere with the app’s functionality.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('7. Privacy'),
            _buildParagraph(
              'Our Privacy Policy governs the collection and use of your data. By using the app, you consent to the collection of your data as described in the Privacy Policy.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('8. Disclaimer of Warranties'),
            _buildParagraph(
              'The app and its services are provided "as-is" without warranties. We do not guarantee that the app will be error-free or uninterrupted. The AI and doctor chat services are not substitutes for professional medical advice.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('9. Limitation of Liability'),
            _buildParagraph(
              'To the fullest extent permitted by law, we are not liable for any damages arising from your use of the app. This includes, but is not limited to, damages related to loss of data, profits, or health outcomes.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('10. Indemnification'),
            _buildParagraph(
              'You agree to indemnify and hold harmless the app from any claims or damages arising out of your use of the app or violation of these Terms.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('11. Modifications'),
            _buildParagraph(
              'We reserve the right to modify these Terms at any time. Any changes will be posted in the app. Continued use of the app constitutes your acceptance of the new Terms.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('12. Governing Law'),
            _buildParagraph(
              'These Terms shall be governed by and construed in accordance with the laws of Ellisville. Any disputes will be resolved in the courts of [Jurisdiction].',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('13. Contact Information'),
            _buildParagraph(
              'For any questions or concerns regarding these Terms, please contact us at:',
            ),
            _buildParagraph(
              'Email: example@gmail.com\nPhone: (123)-456-7890\nAddress: example adress st, notown, nostate, , zipcode, madeupcountry',
            ),
            SizedBox(height: 24),
            Text(
              'Last Updated: October 24,2024',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
