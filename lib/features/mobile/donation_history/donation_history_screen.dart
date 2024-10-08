import 'package:eco_grow/core/components/list_no_data_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/core/utils/format_date_utils.dart';
import 'package:flutter/material.dart';
import 'package:eco_grow/service/remote/donate_service.dart';
import 'package:eco_grow/model/donate_model.dart';

class DonationHistoryScreen extends StatefulWidget {
  const DonationHistoryScreen({super.key});

  @override
  _DonationHistoryScreenState createState() => _DonationHistoryScreenState();
}

class _DonationHistoryScreenState extends State<DonationHistoryScreen> {
  final DonateService donateService = DonateService();
  late Future<List<DonateModel>> _donationsFuture;

  @override
  void initState() {
    super.initState();
    _donationsFuture = donateService.getDonationsByUser();
  }

  Future<void> _refreshDonations() async {
    setState(() {
      _donationsFuture = donateService.getDonationsByUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshDonations,
      child: FutureBuilder<List<DonateModel>>(
        future: _donationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const ListNoDataCustom();
          } else {
            List<DonateModel> donations = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: donations.length,
              itemBuilder: (context, index) {
                DonateModel donation = donations[index];
                return _buildDonateCard(donation);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildDonateCard(DonateModel donation) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${donation.transactionCode ?? 'No Code'}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Số tiền quyên góp: ${donation.money.toVND()}", // Display donation amount
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColor.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  donation.note ??
                      'No Note', // Show the donation note or fallback
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.accentColor,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Ngày: ${FormatDateUtils.formatDateTime(donation.createAt.toLocal())}", // Display formatted date
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
