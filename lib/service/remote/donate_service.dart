import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:eco_grow/model/user_model.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:eco_grow/service/remote/user_service.dart';

class DonateService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserService userService = UserService();
// Thêm một donate vào collection của user
  Future<void> addDonate(double money, String note) async {
    try {
      // Get the user's unique ID
      final uid = await SharedPreferencesService().getUid();

      // Create an instance of DonateModel without the transactionCode for now
      DonateModel donateModel = DonateModel(
        money: money,
        note: note,
        createAt: DateTime.now(),
      );

      // Add the donation to Firestore and get the reference to the new document
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('donations')
          .add(donateModel.toJson());
    } catch (e) {
      print('Error adding donation: $e');
      throw e;
    }
  }

  // Lấy danh sách donate từ một user
  Future<List<DonateModel>> getDonationsByUser() async {
    try {
      final uid = await SharedPreferencesService().getUid();
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('donations')
          .get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return DonateModel(
          transactionCode: doc.id, // Use doc.id as the transactionCode
          money: data[
              'donatePrice'], // Ensure this field matches the actual Firestore field
          note: data['note'],
          createAt: DateTime.parse(data['createAt']),
        );
      }).toList();
    } catch (e) {
      print('Error fetching donations: $e');
      throw e;
    }
  }

  Future<void> updateTotalMoney(double moneyUpdate) async {
    try {
      final uid = await SharedPreferencesService().getUid();

      if (moneyUpdate >= 0) {
        await _firestore.collection('users').doc(uid).update({
          'totalMoney': moneyUpdate,
        });
      } else {
        throw Exception('Số dư không đủ để thực hiện quyên góp!');
      }
    } catch (e) {
      print('Error updating total money: $e');
      throw e;
    }
  }

  // Cập nhật một donate
  Future<void> updateDonate(
      String userId, String donateId, DonateModel updatedDonate) async {
    try {
      final uid = await SharedPreferencesService().getUid();
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('donations')
          .doc(donateId)
          .update(updatedDonate.toJson());
    } catch (e) {
      print('Error updating donation: $e');
      throw e;
    }
  }

  Future<List<DonateModel>> getAllDonates() async {
    List<DonateModel> donations = [];
    List<UserModel> users = await userService.getAllUsers();

    for (UserModel user in users) {
      if (user.donateModels != null && user.donateModels!.isNotEmpty) {
        for (var donation in user.donateModels!) {
          donations.add(DonateModel(
              transactionCode: donation.transactionCode,
              money: donation.money,
              note: donation.note,
              createAt: donation.createAt,
              id: user.id,
              email: user.email,
              userName: user.userName,
              avatar: user.avatar));
        }
      }
    }

    return donations;
  }

  // Xóa một donate
  Future<void> deleteDonate(String userId, String donateId) async {
    try {
      final uid = await SharedPreferencesService().getUid();
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('donations')
          .doc(donateId)
          .delete();
    } catch (e) {
      print('Error deleting donation: $e');
      throw e;
    }
  }
}
