import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/auth/bloc/auth_bloc.dart';
import 'package:news/src/auth/repository/auth_repository.dart';
import 'package:news/src/core/presentation/theme.dart';
import 'package:news/src/news/bloc/news_bloc.dart';
import 'package:news/src/news/repository/news_repository.dart';
import 'package:news/src/start_up/views/start_up_view.dart';
import 'package:sizer/sizer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => NewsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>())
              ..add(IsAuthenticated()),
          ),
          BlocProvider(
            create: (context) => NewsBloc(context.read<NewsRepository>()),
          ),
        ],
        child: Builder(
          builder: (context) {
            return Sizer(
              builder: (context, orientation, deviceType) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppThemes.lightTheme,
                  home: const StartUpView(),
                  // home: const LoginView(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
