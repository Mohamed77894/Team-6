import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../app/routes.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_widgets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({required this.email, super.key});

  final String email;

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _verify() {
    if (_pinController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter the 6-digit OTP from your email.')),
      );
      return;
    }
    context.read<AuthCubit>().verifyEmail(
      email: widget.email,
      otp: _pinController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: 48,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Verify email')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthEmailVerificationSucceeded) {
            context.pushReplacementNamed(
              AppRoutes.login,
              queryParameters: {'email': widget.email},
            );
          } else if (state is AuthOtpResent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('A new OTP has been sent.')),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final loading = state is AuthLoading;
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Check your inbox',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('We sent a 6-digit code to ${widget.email}.'),
                      const SizedBox(height: 32),
                      Pinput(
                        controller: _pinController,
                        length: 6,
                        defaultPinTheme: pinTheme,
                        focusedPinTheme: pinTheme.copyWith(
                          decoration: pinTheme.decoration!.copyWith(
                            border: Border.all(
                              color: Colors.deepOrange,
                              width: 2,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onCompleted: (_) => _verify(),
                      ),
                      const SizedBox(height: 28),
                      AuthPrimaryButton(
                        label: 'Verify email',
                        loading: loading,
                        onPressed: _verify,
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: loading
                            ? null
                            : () => context.read<AuthCubit>().resendOtp(
                                widget.email,
                              ),
                        child: const Text('Did not receive it? Resend OTP'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
