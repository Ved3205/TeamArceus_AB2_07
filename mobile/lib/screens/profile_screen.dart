import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(200, 216, 64, 64),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 229, 194),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'lib/assets/profile_placeholder.png',
                  ), // Add a placeholder image in assets
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  user['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Email: ${user['email']}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Phone: ${user['phone']}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Blood Type: ${user['bloodType']}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Address: ${user['address']}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Is Donor: ${user['isDonor'] ? "Yes" : "No"}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Is Active: ${user['isActive'] ? "Yes" : "No"}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 20),
              const Text(
                'Donation History:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              ...user['donationHistory'].map<Widget>((donation) {
                return Text(
                  '• ${donation['date']} at ${donation['location']}',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
