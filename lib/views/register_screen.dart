import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            style: const TextStyle(color: Colors.white),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _emailController.text;
              final password = _passwordController.text;
              String? message = await Provider.of<AuthProvider>(context, listen: false).register(email, password);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message ?? "Unknown error")));
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
