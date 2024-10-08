import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eco_grow/core/components/app_dialog.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/mobile/login/login_screen.dart';
import 'package:eco_grow/model/user_model.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:eco_grow/service/remote/auth_service.dart';
import 'package:eco_grow/service/remote/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserService userService = UserService();
  UserModel userModel = UserModel(userName: '');
  bool _isLoading = false;
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    _image = await picker.pickImage(source: ImageSource.gallery);

    if (_image != null) {
      try {
        setState(() {
          _isLoading = true;
        });
        await userService.updateUserAvatar(_image!.path);

        await fetchData();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tải ảnh lên thành công!')),
        );
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tải ảnh lên thất bại.')),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    userModel = await userService.getUserModel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        fetchData();
      },
      child: ListView(
        padding: const EdgeInsets.all(AppUtils.mobilePaddingHoriz),
        children: [
          const Text(
            textAlign: TextAlign.center,
            'Thông tin cá nhân',
            style: AppStyle.titleTextWebMobile,
          ),
          const SizedBox(height: 10),
          _buildSection(
              child: Row(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  // Sử dụng Stack để chồng lên CircleAvatar
                  children: [
                    CircleAvatar(
                      radius: 40.0.w,
                      backgroundImage: NetworkImage(userModel.avatar ??
                          'https://as2.ftcdn.net/v2/jpg/03/31/69/91/1000_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg'),
                    ),
                    if (_isLoading) // Kiểm tra nếu đang tải
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black54, // Nền bán trong suốt
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.userName.toString(),
                    style: AppStyle.textContent
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(userModel.email.toString()),
                ],
              ),
            ],
          )),
          _buildSection(
            child: Column(
              children: [
                _buildSectionItem(
                  icon: Icons.attach_money_outlined,
                  label: 'Số dư',
                  balance: userModel.totalMoney,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Text('Khác'),
          const SizedBox(height: 5.0),
          _buildSection(
            child: Column(
              children: [
                _buildSectionItem(
                  icon: Icons.favorite_border,
                  label: 'Về ứng dụng',
                  onTap: () =>
                      _openLink('https://eco-grow-e50ea.firebaseapp.com/'),
                ),
                _buildSectionItem(
                  icon: Icons.logout,
                  label: 'Đăng xuất',
                  onTap: () {
                    AppDialog.customDialog(context,
                            desc: 'Bạn có chắc chắn muốn đăng xuất',
                            btnOkOnPress: () {
                      SharedPreferencesService().clearUid();
                      AuthService().signOut();
                      context.pushAndRemoveUntil(screen: const LoginScreen());
                    }, dialogType: DialogType.warning)
                        .show();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionItem(
      {required IconData icon,
      required String label,
      void Function()? onTap,
      double? balance}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(children: [
          CircleAvatar(
            radius: 23.0.w,
            child: Icon(
              icon,
              color: AppColor.accentColor,
            ),
          ),
          const SizedBox(width: 10.0),
          Text(label),
          const Spacer(),
          if (balance != null) Text(balance.toVND()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              balance != null
                  ? Icons.account_balance_wallet_outlined
                  : Icons.navigate_next_sharp,
              size: 20.0.w,
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildSection({
    Color? backGroundColoer,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: backGroundColoer ?? AppColor.whiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: AppColor.appBoxShaDowns),
      child: child,
    );
  }
}
