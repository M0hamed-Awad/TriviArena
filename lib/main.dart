import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:trivi_arena/styles/themes.dart';
import 'package:trivi_arena/views/home_view.dart';

void main() {
  runApp(const TriviArenaApp());
}

class TriviArenaApp extends StatelessWidget {
  const TriviArenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TriviArena',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: HomeView(),
        ),
      ),
    );
  }
}
