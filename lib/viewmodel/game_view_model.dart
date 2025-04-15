import 'package:flutter/material.dart';
import 'package:roll_roar/model/model.dart';
import 'dart:math';

enum GameState { ready, running, finished }

class GameViewModel extends ChangeNotifier {
  List<Animal> animals = [
    Animal(name: 'Lion', imagePath: '', soundPath: ''),
    Animal(name: 'Tiger', imagePath: '', soundPath: ''),
    Animal(name: 'Mouse', imagePath: '', soundPath: ''),
    Animal(name: 'Eagle', imagePath: '', soundPath: ''),
    Animal(name: 'Pig', imagePath: '', soundPath: ''),
    Animal(name: 'Cat', imagePath: '', soundPath: ''),
  ];
  late Animal currentAnimal;
  late List<Animal> choises = [];
  int diceValue = 1;

  GameState state = GameState.ready;

  GameViewModel();

  rollDice() {
    // Logic to roll the dice and update the game state
    notifyListeners(); // Notify listeners to update the UI
  }

  startGame() {
    // Logic to start the game
    _startRound();
    state = GameState.running;
    notifyListeners(); // Notify listeners to update the UI
  }

  _startRound() {
    diceValue = Random().nextInt(6) + 1; // Simulate dice roll (1-6)
    currentAnimal = animals[diceValue - 1]; // Select animal based on dice value
    List<Animal> shuffled = List<Animal>.from(animals)..shuffle();

    if (!shuffled.take(6).contains(currentAnimal)) {
      shuffled.remove(currentAnimal);
      shuffled = shuffled.take(5).toList();
      shuffled.add(currentAnimal);
      shuffled.shuffle();
      choises = shuffled; // Add current animal to the choices
    } else {
      choises = shuffled.take(6).toList(); // Select 6 random animals
    }
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
