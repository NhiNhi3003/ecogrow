import 'package:eco_grow/core/components/list_no_data_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:eco_grow/service/remote/donate_service.dart';
import 'package:eco_grow/service/remote/user_service.dart';
import 'package:eco_grow/utils/donate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DonateService donateService = DonateService();
  final UserService userService = UserService();

  Future<List<DonateModel>> _fetchDonationData() async {
    List<DonateModel> donations = await donateService.getAllDonates();
    return donations;
  }

  Future<void> _refreshData() async {
    _fetchDonationData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: FutureBuilder<List<DonateModel>>(
        future: _fetchDonationData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const ListNoDataCustom();
          } else {
            List<DonateModel> donations = snapshot.data!;
            List<DonateModel> mostRecentDonations =
                DonationUtils.get5MostRecentDonations(donations);
            List<DonateModel> largestDonations =
                DonationUtils.get5LargestDonations(donations);

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              children: [
                SizedBox(height: 20.h),
                _buildSectionTitle("Ủng hộ nổi bật"),
                SizedBox(height: 10.h),
                _buildDonationList(largestDonations),
                SizedBox(height: 20.h),
                _buildSectionTitle("Ủng hộ mới nhất"),
                SizedBox(height: 10.h),
                _buildDonationList(mostRecentDonations),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColor.accentColor,
      ),
    );
  }

  Widget _buildDonationList(List<DonateModel> donations) {
    return ListView.builder(
      itemCount: donations.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildDonateCard(donations[index]);
      },
    );
  }

  Widget _buildDonateCard(DonateModel donate) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 45.0.w,
              backgroundImage: NetworkImage(donate.avatar ??
                  'https://as2.ftcdn.net/v2/jpg/03/31/69/91/1000_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg'),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#${donate.transactionCode ?? 'N/A'}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Tên: ${donate.userName}",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                  Text(
                    "Số tiền quyên góp: ${donate.money.toVND()}",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColor.accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      donate.note ?? 'Không có ghi chú',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
