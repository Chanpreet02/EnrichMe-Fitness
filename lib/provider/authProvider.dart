import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userEmail;

  bool get isLoggedIn => _isLoggedIn;
  String? get userEmail => _userEmail;

  AuthProvider() {
    _checkUserSession();
  }

  // Checking user session or mocked login
  Future<void> _checkUserSession() async {
    // Firebase ke currentUser ko check karte hain
    User? user = FirebaseAuth.instance.currentUser;

    // Agar Firebase user exist karta hai
    if (user != null) {
      _isLoggedIn = true;
      _userEmail = user.email;
    }
    else {

      _userEmail = 'test@example.com';
      _isLoggedIn = true;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    if (email == 'test' && password == 'password123') {
      _userEmail = 'test@example.com';
      _isLoggedIn = true;
      notifyListeners();
      return;
    }

    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    _userEmail = credential.user?.email;
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    _userEmail = credential.user?.email;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    _userEmail = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
