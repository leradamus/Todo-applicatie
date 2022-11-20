import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_application/first_page.dart';
import 'package:todo_application/second_page.dart';
import 'package:todo_application/skeleton.dart';

import 'bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) => Skeleton(widget: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const FirstPage(),
          ),
          GoRoute(
            path: '/2',
            builder: (context, state) => const SecondPage(),
          )
        ]
    )
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFEE81),
        ),
        routerConfig: _router,
      ),
    );
  }
}


