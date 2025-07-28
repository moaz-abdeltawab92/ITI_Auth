part of 'signup_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String email;

  SignUpSuccess(this.email);
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}

class SignUpValidationState extends SignUpState {
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isValid;

  SignUpValidationState({
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    required this.isValid,
  });
}
