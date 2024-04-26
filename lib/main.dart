// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/movie_provider.dart';
import 'views/login_screen.dart';
import 'views/home_screen.dart';
import 'views/profile_screen.dart';
import 'views/movie_search_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBpuHKtROPf3O7pjf1yJV63KMlaM7LBNAw",
      appId: "1:247551510909:android:70a9fb374c96ed826fa414",
      projectId: "movieee-ba957",
      messagingSenderId: '247551510909',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MaterialApp(
        title: 'MOVIEEE',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/search': (context) => SearchScreen(),
          '/profile': (context) =>  ProfileScreen(),
          '/register': (context) => RegisterScreen(),
          '/logout': (context) => LoginScreen(),
        },
      ),
    );
  }
}
