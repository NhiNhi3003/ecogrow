import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:eco_grow/model/user_model.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
