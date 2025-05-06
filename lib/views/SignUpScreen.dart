import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            TextField(controller: confirmController, decoration: InputDecoration(labelText: "Confirm Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (passwordController.text != confirmController.text) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(title: Text("Error"), content: Text("Passwords do not match")),
                  );
                  return;
                }
                try {
                  await Provider.of<AuthProvider>(context, listen: false).signup(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(title: Text("Error"), content: Text(e.toString())),
                  );
                }
              },
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
