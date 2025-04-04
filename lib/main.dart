import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app_navigator.dart';
import 'package:untitled1/nav_cubit.dart';
import 'package:untitled1/posts_cubit.dart';
import 'package:untitled1/posts_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavCubit()),
          BlocProvider(create: (context) => PostsBloc()..add(LoadPostsEvent())),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
