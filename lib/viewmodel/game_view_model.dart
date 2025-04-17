import 'package:flutter/material.dart';
import 'package:roll_roar/model/model.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

enum GameState { ready, running, finished }

class GameViewModel extends ChangeNotifier {
  List<Animal> animals = [
    Animal(name: 'Lion', imagePath: 'assets/images/lion.jpg', soundPath: 'sounds/lion.mp3'),
    Animal(name: 'Tiger', imagePath: 'assets/images/SC.jpg', soundPath: 'sounds/tiger.mp3'),
    Animal(name: 'Mouse', imagePath: 'assets/images/TC.jpg', soundPath: 'sounds/mouse.mp3'),
    Animal(name: 'Eagle', imagePath: 'assets/images/MB.jpg', soundPath: 'sounds/eagle.mp3'),
    Animal(name: 'Pig', imagePath: 'assets/images/JP.jpg', soundPath: 'sounds/pig.mp3'),
    Animal(name: 'Cat', imagePath: 'assets/images/cat.jpg', soundPath: 'sounds/cat.mp3'),
  ];

  final AudioPlayer _player = AudioPlayer();
  late Animal currentAnimal;
  late List<Animal> choises = [];
  int diceValue = 1;

  GameState state = GameState.ready;

  GameViewModel();

  Future<void> rollDice() async {
    _startRound(); // Fill choices and dice for new round
    notifyListeners();
    if (currentAnimal.soundPath.isNotEmpty) {
      await _player.stop();
      await _player.play(AssetSource(currentAnimal.soundPath));
    }
  }

  startGame() {
    // Logic to start the game
    _startRound();
    state = GameState.running;
    notifyListeners(); // Notify listeners to update the UI
  }

  void _startRound() {
    diceValue = Random().nextInt(6) + 1; // Simulate dice roll (1-6)
    currentAnimal = animals[diceValue - 1]; // Select animal based on dice value
    List<Animal> shuffled =
        List<Animal>.from(animals)
          ..remove(currentAnimal)
          ..shuffle();
    choises = [currentAnimal, ...shuffled.take(3)];
    choises.shuffle(); // Randomize order
  }

  playSound() {
    // Logic to play sound
    notifyListeners(); // Notify listeners to update the UI
  }

  selectAnimal() {
    // Logic to select an animal
    notifyListeners(); // Notify listeners to update the UI
  }
}
