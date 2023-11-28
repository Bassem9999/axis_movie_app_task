import 'package:axis_movie_app_task/features/details/controllers/providers/peoles_details_provider.dart';
import 'package:axis_movie_app_task/features/home/controllers/providers/home_provider.dart';
import 'package:axis_movie_app_task/features/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => HomeProvider()),
         ChangeNotifierProvider(create: (context) => PeoplesDetailsProvider()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) => MaterialApp(
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          
          // scaffoldBackgroundColor: const Color.fromARGB(255, 52, 52, 52),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}

