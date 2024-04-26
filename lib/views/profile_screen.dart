import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome, User!"), 
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of
                <AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
