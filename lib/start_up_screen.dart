import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'theme_cubit.dart';
import 'theme_state.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Image.asset(
                  'assets/Imges/Talabat.png',
                  width: 100,
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Your everyday, right away',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              'Login or create an account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Receive rewards and save your details for a faster checkout experience.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: 300,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Imges/Google.jpg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: 300,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Imges/Facebook.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Continue with Facebook',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: 300,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Imges/Apple.jpg',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Continue with Apple',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            InkWell(
              onTap: () {
                context.push('/emailLoginScreen');
              },
              child: Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Continue with Email',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Switch(
                  value: state.isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().changeTheme();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}