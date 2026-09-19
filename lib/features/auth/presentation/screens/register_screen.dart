import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool get _validPassword =>
      _passwordController.text.length >= 8 &&
      RegExp(r'[A-Z]').hasMatch(_passwordController.text) &&
      RegExp(r'[a-z]').hasMatch(_passwordController.text) &&
      RegExp(r'[0-9]').hasMatch(_passwordController.text) &&
      RegExp(r'[^A-Za-z0-9]').hasMatch(_passwordController.text);

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate() || !_validPassword) {
      setState(() {});
      return;
    }
    context.read<AuthCubit>().register(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthRegistrationSucceeded) {
            context.pushReplacementNamed(
              AppRoutes.verifyEmail,
              queryParameters: {'email': state.email},
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Create your account',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'An OTP is sent only after the registration request succeeds.',
                        ),
                        const SizedBox(height: 24),
                        AuthTextField(
                          controller: _firstNameController,
                          label: 'First name',
                          validator: (value) =>
                              requiredField(value, 'First name'),
                        ),
                        const SizedBox(height: 14),
                        AuthTextField(
                          controller: _lastNameController,
                          label: 'Last name',
                          validator: (value) =>
                              requiredField(value, 'Last name'),
                        ),
                        const SizedBox(height: 14),
                        AuthTextField(
                          controller: _emailController,
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                        const SizedBox(height: 14),
                        AuthTextField(
                          controller: _passwordController,
                          label: 'Password',
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (!_validPassword) {
                              return 'Use the requirements below';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        _PasswordRules(password: _passwordController.text),
                        const SizedBox(height: 24),
                        AuthPrimaryButton(
                          label: 'Create account',
                          loading: loading,
                          onPressed: _register,
                        ),
                      ],
                    ),
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

class _PasswordRules extends StatelessWidget {
  const _PasswordRules({required this.password});

  final String password;

  @override
  Widget build(BuildContext context) {
    final rules = <(String, bool)>[
      ('At least 8 characters', password.length >= 8),
      ('An uppercase letter', RegExp(r'[A-Z]').hasMatch(password)),
      ('A lowercase letter', RegExp(r'[a-z]').hasMatch(password)),
      ('A number', RegExp(r'[0-9]').hasMatch(password)),
      ('A symbol', RegExp(r'[^A-Za-z0-9]').hasMatch(password)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rules
          .map(
            (rule) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(
                    rule.$2 ? Icons.check_circle : Icons.circle_outlined,
                    size: 16,
                    color: rule.$2 ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 6),
                  Text(rule.$1),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
