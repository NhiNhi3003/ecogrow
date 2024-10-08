import 'package:eco_grow/model/donate_model.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? userName;
  final double? totalMoney;
  final String? avatar;
  final List<DonateModel>? donateModels;

  UserModel({
    this.avatar,
    this.id,
    this.email,
    required this.userName,
    this.donateModels,
    this.totalMoney,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'email': email ?? '',
      'userName': userName ?? '',
      'totalMoney': totalMoney ?? 0.0,
      'avatar': avatar ?? '',
      'donateModels':
          donateModels?.map((donation) => donation.toJson()).toList() ?? [],
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      avatar: map['avatar'],
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
      totalMoney: (map['totalMoney'] as num?)?.toDouble() ?? 0.0,
      donateModels: map['donateModels'] != null
          ? List<DonateModel>.from(
              (map['donateModels'] as List).map((donationMap) => DonateModel(
                    transactionCode: donationMap['transactionCode'],
                    money: (donationMap['donatePrice'] as num).toDouble(),
                    note: donationMap['note'],
                    createAt: DateTime.parse(donationMap['createAt']),
                  )),
            )
          : [],
    );
  }
}
