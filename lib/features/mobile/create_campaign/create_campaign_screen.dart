import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/components/app_dialog.dart';
import 'package:eco_grow/core/components/app_input.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:eco_grow/model/user_model.dart';
import 'package:eco_grow/service/remote/donate_service.dart';
import 'package:eco_grow/service/remote/user_service.dart';
import 'package:eco_grow/utils/donate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({super.key});

  @override
  State<CreateCampaignScreen> createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  double totalDonate = 0;
  double balance = 0.0;

  TextEditingController donateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  DonateService donateService = DonateService();
  UserService userService = UserService();
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final doantions = await donateService.getDonationsByUser();
    UserModel userModel = await userService.getUserModel();
    balance = userModel.totalMoney ?? 0.0;
    totalDonate = DonationUtils.calculateTotalDonation(doantions);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppUtils.mobilePaddingHoriz),
      children: [
        Text(totalDonate.toVND(),
            textAlign: TextAlign.center, style: AppStyle.titleText),
        SizedBox(height: 60.0.h),
        Lottie.asset(
          Assets.json.tree1,
        ),
        AppInput(
          textEditingController: donateController,
          keyboardType: TextInputType.number,
          hintText: 'Nhập số tiền muốn quyên góp',
        ),
        SizedBox(height: 10.0.h),
        AppInput(
          textEditingController: noteController,
          keyboardType: TextInputType.text,
          hintText: 'Nhập ghi chú cho khoản quyên góp (tùy chọn)',
        ),
        const SizedBox(height: 20.0),
        AppButton(
          textButton: 'Quyên góp ngay',
          onPressed: () {
            // Parse số tiền từ donateController
            double donateAmount = double.parse(donateController.text);

            // Kiểm tra nếu số tiền donate lớn hơn totalMoney
            if (donateAmount > balance) {
              // Hiển thị thông báo số dư không đủ
              AppDialog.customDialog(
                context,
                dialogType: DialogType.error,
                desc: 'Số dư không đủ để thực hiện quyên góp!',
                btnOkOnPress: () {},
              ).show();
            } else {
              // Nếu số tiền hợp lệ, hiển thị hộp thoại xác nhận
              AppDialog.customDialog(
                context,
                dialogType: DialogType.infoReverse,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Bạn có chắc chắn muốn ủng hộ số tiền',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${donateAmount.toVND()}\n',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.accentColor,
                                fontSize: 22,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ' vào quỹ sống xanh không? Số tiền này sẽ không được hoàn lại sau khi xác nhận quyên góp.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Ghi chú: ${noteController.text}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                btnOkOnPress: () async {
                  // Thực hiện quyên góp
                  donateService
                      .addDonate(donateAmount, noteController.text)
                      .then((value) {
                    // Hiển thị thông báo thành công
                    AppDialog.successDialog(
                      context,
                      desc: 'Ủng hộ thành công!',
                      btnOkOnPress: () {},
                    ).show();
                  });

                  await donateService.updateTotalMoney(balance - donateAmount);
                  // Làm mới dữ liệu và xóa nội dung nhập
                  fetchData();
                  donateController.clear();
                  noteController.clear();
                },
              ).show();
            }
          },
        )
      ],
    );
  }
}
