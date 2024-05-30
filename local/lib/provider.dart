import 'package:flutter/material.dart';
import 'package:local/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local/injection.dart';

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
          create: (context) =>
              Injection.authBloc,
        )
      ],
      child: const MyApp(),
    );
  }
}
