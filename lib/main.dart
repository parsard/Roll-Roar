import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roll_roar/view/welcome_screen.dart';
import 'package:roll_roar/viewmodel/game_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameViewModel())],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
        title: 'Roll & Roar',
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
