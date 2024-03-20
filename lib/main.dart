import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/auth_bloc.dart';
import 'package:login_bloc/login_screen.dart';
import 'package:login_bloc/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: "Login",
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
        home: const LoginScreen(),
      ),
    );
  }
}
