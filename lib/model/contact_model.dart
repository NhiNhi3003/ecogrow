import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final IconData icon;

  ContactModel({required this.title, required this.icon});

  static List<ContactModel> contactModels = [
    ContactModel(title: '+123 456 7890', icon: Icons.phone_android),
    ContactModel(title: 'ecogrow303@gmail.com', icon: Icons.email_outlined),
    ContactModel(
        title: 'Bà Rịa - Vũng Tàu',
        icon: Icons.map_outlined)
  ];
}
