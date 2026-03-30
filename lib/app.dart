import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherxl/core/services/service_locator.dart';
import 'package:weatherxl/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weatherxl/features/auth/presentation/bloc/auth_event.dart';
import 'package:weatherxl/features/auth/presentation/bloc/auth_state.dart';
import 'package:weatherxl/features/auth/presentation/pages/login_page.dart';
import 'package:weatherxl/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>()..add(AppStarted()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather XL',
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return const HomePage();
            }
            if (state is AuthUnauthenticated || state is AuthError) {
              return const LoginPage();
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
