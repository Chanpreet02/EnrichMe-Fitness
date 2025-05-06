import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';
import 'signupScreen.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Provider.of<AuthProvider>(context, listen: false).login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(title: Text('Login Failed'), content: Text(e.toString())),
                  );
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen())),
              child: Text("Don't have an account? Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
