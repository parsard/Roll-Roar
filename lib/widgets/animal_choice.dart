import 'package:flutter/material.dart';
import 'package:roll_roar/model/model.dart';

class AnimalChoice extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;
  const AnimalChoice({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(animal.imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
