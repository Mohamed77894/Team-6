import 'package:flutter/material.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.close,
                  size: 20,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Continue with email',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  border: const UnderlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  border: const UnderlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),

                  const Text(
                    'Create an account?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}