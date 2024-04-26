import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome, User!"),  // Ideally, this should fetch user data
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Provider.of<AuthProvider>(context, listen: false).logout(),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
//ARCHITECTURE
//PROFILE
//FIGMA
//GITHUB
