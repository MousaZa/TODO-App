import 'package:flutter/material.dart';

class Task {
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'icon': icon.codePoint,
      'isCompleted': isCompleted,
    };
  }


  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      description: map['description'],
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      isCompleted: map['isCompleted'],
    );
  }

  final String name;
  final String description;
  final IconData icon;
  bool isCompleted = false;

  Task({
    required this.name,
    required this.description,
    required this.icon,
    required isCompleted,
  });
}
