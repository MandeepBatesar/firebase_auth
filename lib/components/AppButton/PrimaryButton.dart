import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isExpanded;
  final bool isloading;
  final bool backGroundTransparent;
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backGroundTransparent = false,
    this.isExpanded = false,
    this.isloading = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
        onPressed: () {
          isloading ? null : onPressed();
        },
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            backgroundColor: backGroundTransparent
                ? Colors.white
                : AppColors().primary,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors().primary),
                borderRadius: BorderRadius.circular(10))),
        child: isloading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors().white,
                ),
              )
            : Text(
                title,
                style: AppTextTheme().fs16Normal.copyWith(
                    color: backGroundTransparent
                        ? AppColors().primary
                        : AppColors().white),
              ));
    return isExpanded ? Expanded(child: button) : button;
  }
}
