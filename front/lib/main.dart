import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/domain/bloc/app_blocs.dart';
import 'package:front/domain/bloc/container/container_bloc.dart';
import 'package:front/domain/bloc/container_provider.dart';
import 'package:front/domain/bloc/server/server_bloc.dart';
import 'package:front/ui/font_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ui/screens/dashboard.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> ContainerListBloc()),
        BlocProvider(create: (_)=> ContainerStatusBloc()),
        BlocProvider(create: (_)=> ImageBloc()),
        BlocProvider(create: (_)=> ServerBloc())
      ], 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      // ignore: prefer_const_constructors
      home: Dashboard(),
    );
  }
}
