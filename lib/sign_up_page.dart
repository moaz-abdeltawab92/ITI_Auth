import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                'Sign up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Create your account',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  filled: true,
                  fillColor: Color(0xffEFE4F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Color(0xffEFE4F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Color(0xffEFE4F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Color(0xffEFE4F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF9B28B2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Sign up', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 16),
              Center(child: Text("Or")),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF9A11FF),
                    side: BorderSide(color: Color(0xFF9A11FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Sign In with Google'),
                ),
              ),
              SizedBox(height: 100),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Color(0xFF9A11FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
