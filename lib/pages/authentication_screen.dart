import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import for Firebase Authentication

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  bool _isSigningUp = false; // Flag to toggle between login and signup states
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  // Handle login or signup with Firebase Authentication
  Future<void> _authenticate(bool isSigningUp) async {
    try {
      final auth = FirebaseAuth.instance;
      if (isSigningUp) {
        await auth.createUserWithEmailAndPassword(email: _email, password: _password);
      } else {
        await auth.signInWithEmailAndPassword(email: _email, password: _password);
      }
      // Navigate to the next screen after successful authentication (replace with your logic)
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = error.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSigningUp ? 'Sign Up' : 'Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() => _email = value),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true, // Hide password characters
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() => _password = value),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text(_isSigningUp ? 'Sign Up' : 'Login'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _errorMessage = ''; // Clear previous error messages
                      setState(() {});
                      await _authenticate(_isSigningUp);
                    }
                  },
                ),
                SizedBox(height: 15.0),
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                TextButton(
                  child: Text(_isSigningUp ? 'Already have an account? Login' : 'Don\'t have an account? Sign Up'),
                  onPressed: () => setState(() => _isSigningUp = !_isSigningUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}