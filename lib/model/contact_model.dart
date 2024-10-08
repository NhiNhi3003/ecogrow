import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final IconData icon;

  ContactModel({required this.title, required this.icon});

  static List<ContactModel> contactModels = [
    ContactModel(title: '+123 456 7890', icon: Icons.phone_android),
    ContactModel(title: 'ecogrow303@gmail.com', icon: Icons.email_outlined),
    ContactModel(
        title: 'Hoàng Minh Giám, Phường 3, Gò Vấp, Hồ Chí Minh, Vietnam',
        icon: Icons.map_outlined)
  ];
}
