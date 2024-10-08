import 'package:eco_grow/model/user_model.dart';

class DonateModel extends UserModel {
  final String? transactionCode;
  final double money;
  final String? note;
  final DateTime createAt;

  DonateModel(
      {this.transactionCode,
      required this.money,
      this.note,
      required this.createAt,
      super.id,
      super.email,
      super.userName,
      super.avatar});

  // Convert DonateModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'transactionCode': transactionCode ?? '',
      'donatePrice': money,
      'note': note ?? '',
      'createAt': createAt.toIso8601String(),
    };
  }
}
