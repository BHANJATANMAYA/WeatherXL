import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherxl/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:weatherxl/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:weatherxl/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:weatherxl/features/auth/domain/usecases/logout_usecase.dart';
import 'package:weatherxl/features/auth/domain/usecases/register_with_email_usecase.dart';

import 'package:weatherxl/features/auth/domain/usecases/send_password_reset_email_usecase.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithEmailUseCase loginWithEmail;
  final RegisterWithEmailUseCase registerWithEmail;
  final LoginWithGoogleUseCase loginWithGoogle;
  final LogoutUseCase logout;
  final CheckAuthStatusUseCase checkAuthStatus;
  final SendPasswordResetEmailUseCase sendPasswordResetEmail;

  AuthBloc({
    required this.loginWithEmail,
    required this.registerWithEmail,
    required this.loginWithGoogle,
    required this.logout,
    required this.checkAuthStatus,
    required this.sendPasswordResetEmail,
  }) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginWithEmail>(_onLoginWithEmail);
    on<RegisterWithEmail>(_onRegisterWithEmail);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<LogoutRequested>(_onLogoutRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  /// Extracts a user-friendly error message from various exception types.
  String _friendlyError(Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return 'No account found with this email.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'email-already-in-use':
          return 'An account already exists with this email.';
        case 'invalid-email':
          return 'Please enter a valid email address.';
        case 'weak-password':
          return 'Password is too weak. Use at least 6 characters.';
        case 'account-exists-with-different-credential':
          return 'An account already exists with a different sign-in method.';
        case 'network-request-failed':
          return 'Network error. Please check your connection.';
        default:
          return e.message ?? 'Authentication failed. Please try again.';
      }
    }
    final msg = e.toString();
    // Strip "Exception: " prefix for cleaner display
    if (msg.startsWith('Exception: ')) {
      return msg.substring(11);
    }
    return msg;
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    try {
      final user = await checkAuthStatus();
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (_) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginWithEmail(
    LoginWithEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await loginWithEmail(event.email, event.password);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onRegisterWithEmail(
    RegisterWithEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await registerWithEmail(event.email, event.password);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginWithGoogle(
    LoginWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await loginWithGoogle();
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      debugPrint('Logout error: $e');
      emit(AuthError(_friendlyError(e)));

      final user = await checkAuthStatus();

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError('Unexpected error'));
      }
    }
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await sendPasswordResetEmail(event.email);
      emit(AuthPasswordResetEmailSent());
      emit(AuthUnauthenticated()); // revert to standard state
    } catch (e) {
      emit(AuthError(_friendlyError(e)));
      emit(AuthUnauthenticated());
    }
  }
}

