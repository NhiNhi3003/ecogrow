import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static AwesomeDialog customDialog(BuildContext context,
      {Widget? body,
      required void Function()? btnOkOnPress,
      required DialogType dialogType,
      String? desc,
      bool showCancelButton = true}) {
    return AwesomeDialog(
      context: context,
      padding: const EdgeInsets.all(10.0),
      dialogType: dialogType,
      btnOkColor: AppColor.accentColor,
      desc: desc,
      descTextStyle: const TextStyle(fontSize: 18),
      borderSide: const BorderSide(
        color: AppColor.accentColor,
        width: 2,
      ),
      width: double.infinity,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dismissed by $type'),
          ),
        );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Thông báo',
      body: body,
      showCloseIcon: true,
      btnCancelOnPress: showCancelButton
          ? () {}
          : null, // Only show cancel button if `showCancelButton` is true
      btnOkOnPress: btnOkOnPress,
    );
  }

  // Success dialog with only "OK" button
  static AwesomeDialog successDialog(BuildContext context,
      {required void Function()? btnOkOnPress, String? desc}) {
    return AwesomeDialog(
      context: context,
      padding: const EdgeInsets.all(10.0),
      dialogType: DialogType.success,
      btnOkColor: AppColor.accentColor,
      desc: desc ?? 'Thao tác thành công!',
      descTextStyle: const TextStyle(fontSize: 18),
      borderSide: const BorderSide(
        color: AppColor.accentColor,
        width: 2,
      ),
      width: double.infinity,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dismissed by $type'),
          ),
        );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Thông báo',
      showCloseIcon: false,
      btnCancelOnPress: null,
      btnOkOnPress: btnOkOnPress,
    );
  }
}
