import 'package:eco_grow/model/donate_model.dart';

class DonationUtils {
  static List<DonateModel> get5MostRecentDonations(
      List<DonateModel> donations) {
    donations.sort((a, b) => b.createAt.compareTo(a.createAt));
    return donations.take(5).toList();
  }

  static List<DonateModel> get5LargestDonations(List<DonateModel> donations) {
    donations.sort((a, b) => b.money.compareTo(a.money));
    return donations.take(5).toList();
  }

  static double calculateTotalDonation(List<DonateModel> donations) {
    double totalAmount = 0;

    for (DonateModel donation in donations) {
      totalAmount += donation.money;
    }

    return totalAmount;
  }
}
