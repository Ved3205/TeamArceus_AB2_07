import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  final List<Map<String, String>> _emergencyContacts = const [
    {
      'name': 'Contact 1',
      'phone': '1234567890',
      'email': 'contact1@example.com',
    },
    {
      'name': 'Contact 2',
      'phone': '0987654321',
      'email': 'contact2@example.com',
    },
  ];

  void _sendSosAlert(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('SOS Alert Sent')));
    // Add functionality to send SOS alert
  }

  void _showContactModal(
    BuildContext context,
    String name,
    String phone,
    String email,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Contact $name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.call, color: Colors.black),
                title: const Text(
                  'Call',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () async {
                  final Uri launchUri = Uri(scheme: 'tel', path: phone);
                  if (await canLaunchUrl(launchUri)) {
                    await launchUrl(launchUri);
                  } else {
                    throw 'Could not launch $launchUri';
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.black),
                title: const Text(
                  'Email',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () async {
                  final Uri launchUri = Uri(scheme: 'mailto', path: email);
                  if (await canLaunchUrl(launchUri)) {
                    await launchUrl(launchUri);
                  } else {
                    throw 'Could not launch $launchUri';
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Screen'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(200, 216, 64, 64),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 229, 194),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _sendSosAlert(context),
              icon: const Icon(Icons.warning, color: Colors.black),
              label: const Text(
                'Send SOS Alert',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Emergency Contacts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _emergencyContacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                      title: Text(_emergencyContacts[index]['name']!),
                      subtitle: Text(
                        'Phone: ${_emergencyContacts[index]['phone']}',
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showContactModal(
                            context,
                            _emergencyContacts[index]['name']!,
                            _emergencyContacts[index]['phone']!,
                            _emergencyContacts[index]['email']!,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Contact'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
