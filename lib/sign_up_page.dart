import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/signup_bloc.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingUpScreenWithBloc extends StatefulWidget {
  const SingUpScreenWithBloc({super.key});

  @override
  State<SingUpScreenWithBloc> createState() => _SingUpScreenWithBlocState();
}

final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

class _SingUpScreenWithBlocState extends State<SingUpScreenWithBloc> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),

      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
          if (state is SignUpSuccess) {
            Fluttertoast.showToast(
              msg: 'Sign up successful! Welcome ${state.email}',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(userEmail: state.email),
                  ),
                );
              }
            });
          }
        },
        builder: (context, state) {
          if (state is SignUpLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.email),
                          errorText:
                              state is SignUpValidationState
                                  ? state.emailError
                                  : null,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context.read<SignUpBloc>().add(
                            SignUpEmailChangedEvent(value),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          errorText:
                              state is SignUpValidationState
                                  ? state.passwordError
                                  : null,
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          context.read<SignUpBloc>().add(
                            SignUpPasswordChangedEvent(value),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          errorText:
                              state is SignUpValidationState
                                  ? state.confirmPasswordError
                                  : null,
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          context.read<SignUpBloc>().add(
                            SignUpConfirmPasswordChangedEvent(value),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<SignUpBloc>().add(
                              SignUpSubmittedEvent(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                confirmPassword:
                                    _confirmPasswordController.text.trim(),
                              ),
                            );
                          },
                          child: const Text('Sign Up'),
                        ),
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
