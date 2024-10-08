import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:eco_grow/model/user_model.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<void> updateUserAvatar(String avatarFilePath) async {
    try {
      final uid = await SharedPreferencesService().getUid();

      // Tạo tên hình ảnh dựa trên uid
      String fileName = '$uid.png'; // Bạn có thể thay đổi đuôi nếu cần

      // Đẩy hình ảnh lên Firebase Storage
      File avatarFile = File(avatarFilePath);
      TaskSnapshot uploadTask =
          await _storage.ref('avatars/$fileName').putFile(avatarFile);

      // Lấy URL của hình ảnh đã upload
      String avatarUrl = await uploadTask.ref.getDownloadURL();

      // Cập nhật đường dẫn hình ảnh vào Firestore
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'avatar': avatarUrl});
    } catch (e) {
      print('Error updating avatar: $e');
      throw e;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot userSnapshot = await _firestore.collection('users').get();
      List<UserModel> users = [];
      for (var userDoc in userSnapshot.docs) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        QuerySnapshot donationSnapshot = await _firestore
            .collection('users')
            .doc(userDoc.id)
            .collection('donations')
            .get();

        List<DonateModel> donations = donationSnapshot.docs.map((donationDoc) {
          Map<String, dynamic> donationData =
              donationDoc.data() as Map<String, dynamic>;
          return DonateModel(
            transactionCode: donationDoc.id,
            money: donationData['donatePrice'].toDouble(),
            note: donationData['note'],
            createAt: DateTime.parse(donationData['createAt']),
          );
        }).toList();

        UserModel user = UserModel(
            id: userDoc.id,
            email: userData['email'],
            userName: userData['userName'],
            donateModels: donations,
            avatar: userData['avatar']);

        // Add user to the list
        users.add(user);
      }

      return users; // Return the list of all users
    } catch (e) {
      print('Error fetching users: $e');
      throw e;
    }
  }

  Future<UserModel> getUserModel() async {
    try {
      final uid = await SharedPreferencesService().getUid();
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await _firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        Map<String, dynamic>? data = userSnapshot.data();
        if (data != null) {
          return UserModel.fromJson(data);
        } else {
          throw Exception('User data is null');
        }
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }
}
