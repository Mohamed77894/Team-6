import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController passwordController = TextEditingController();

  bool hasEightCharacters = false;
  bool hasCapitalLetter = false;
  bool hasSmallLetter = false;
  bool hasNumber = false;
  bool hasSymbol = false;

  void checkPassword(String password) {
    setState(() {
      hasEightCharacters = password.length >= 8;
      hasCapitalLetter = RegExp(r'[A-Z]').hasMatch(password);
      hasSmallLetter = RegExp(r'[a-z]').hasMatch(password);
      hasNumber = RegExp(r'[0-9]').hasMatch(password);
      hasSymbol = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to talabat',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const Text(
                'Create Your account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                decoration: InputDecoration(
                  hintText: 'First Name',
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
                decoration: InputDecoration(
                  hintText: 'Last Name',
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
                controller: passwordController,
                obscureText: true,
                onChanged: checkPassword,
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

              // Password requirements
              Text(
                'Password must contain:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              passwordRequirement(
                'At least 8 characters',
                hasEightCharacters,
              ),

              passwordRequirement(
                'At least one capital letter',
                hasCapitalLetter,
              ),

              passwordRequirement(
                'At least one small letter',
                hasSmallLetter,
              ),

              passwordRequirement(
                'At least one number',
                hasNumber,
              ),

              passwordRequirement(
                'At least one symbol',
                hasSymbol,
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
                    'Create account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordRequirement(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.circle_outlined,
          size: 14,
          color: isValid ? Colors.green : Colors.grey,
        ),

        const SizedBox(width: 6),

        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 9,
            color: isValid ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}