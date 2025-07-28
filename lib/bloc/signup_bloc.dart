import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class ValidationResult {
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isValid;
  ValidationResult({
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    required this.isValid,
  });
}

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    on<SignUpReset>(_onSignUpReset);
    on<SignUpEmailChangedEvent>(_onEmailChanged);
    on<SignUpPasswordChangedEvent>(_onPasswordChanged);
    on<SignUpConfirmPasswordChangedEvent>(_onConfirmPasswordChanged);
  }

  ValidationResult validateAll(
    String email,
    String password,
    String confirmPassword,
  ) {
    String? emailError;
    String? passwordError;
    String? confirmPasswordError;
    bool isValid = true;

    // Email validation
    if (email.isEmpty) {
      emailError = 'Email is required';
      isValid = false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(email)) {
      emailError = 'Please enter a valid email';
      isValid = false;
    }

    // Password validation
    if (password.isEmpty) {
      passwordError = 'Password is required';
      isValid = false;
    } else if (password.length < 8) {
      passwordError = 'Password must be at least 8 characters';
      isValid = false;
    } else if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]',
    ).hasMatch(password)) {
      passwordError =
          'Password must contain uppercase, lowercase, number and special character';
      isValid = false;
    }

    // Confirm password validation
    if (confirmPassword.isEmpty) {
      confirmPasswordError = 'Please confirm your password';
      isValid = false;
    } else if (password != confirmPassword) {
      confirmPasswordError = 'Passwords do not match';
      isValid = false;
    }

    return ValidationResult(
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      isValid: isValid,
    );
  }

  void _onEmailChanged(
    SignUpEmailChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    _email = event.email;
    final result = validateAll(_email, _password, _confirmPassword);
    emit(
      SignUpValidationState(
        emailError: result.emailError,
        passwordError: result.passwordError,
        confirmPasswordError: result.confirmPasswordError,
        isValid: result.isValid,
      ),
    );
  }

  void _onPasswordChanged(
    SignUpPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    _password = event.password;
    final result = validateAll(_email, _password, _confirmPassword);
    emit(
      SignUpValidationState(
        emailError: result.emailError,
        passwordError: result.passwordError,
        confirmPasswordError: result.confirmPasswordError,
        isValid: result.isValid,
      ),
    );
  }

  void _onConfirmPasswordChanged(
    SignUpConfirmPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    _confirmPassword = event.confirmPassword;
    final result = validateAll(_email, _password, _confirmPassword);
    emit(
      SignUpValidationState(
        emailError: result.emailError,
        passwordError: result.passwordError,
        confirmPasswordError: result.confirmPasswordError,
        isValid: result.isValid,
      ),
    );
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    _email = event.email;
    _password = event.password;
    _confirmPassword = event.confirmPassword;

    final result = validateAll(_email, _password, _confirmPassword);
    emit(
      SignUpValidationState(
        emailError: result.emailError,
        passwordError: result.passwordError,
        confirmPasswordError: result.confirmPasswordError,
        isValid: result.isValid,
      ),
    );
    if (!result.isValid) {
      emit(SignUpFailure('Please fix the validation errors'));
      return;
    }

    emit(SignUpLoading());
    await Future.delayed(const Duration(seconds: 2));
    if (event.email == 'exists@example.com') {
      emit(SignUpFailure('Email already in use'));
    } else {
      emit(SignUpSuccess(event.email));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    _email = '';
    _password = '';
    _confirmPassword = '';
    emit(SignUpInitial());
  }
}
