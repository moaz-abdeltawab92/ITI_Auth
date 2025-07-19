import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_up_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                'Welcome Back',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Enter your credential to login',
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
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Color(0xFF9A11FF)),
                ),
              ),
              SizedBox(height: 150),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
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
