import 'package:flutter/material.dart';

import 'light_theme.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.alinment = Alignment.center,
    this.borderColor,
    this.height,
    this.textColor,
    this.borderEnable = true,
    this.loading = false,
  });
  final double? height;

  final bool borderEnable;
  // final Widget content;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final String text;
  final AlignmentGeometry alinment;
  late bool loading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // elevation: color ==Colors.transparent?0:null,
      padding: EdgeInsets.zero,
      height: height ?? 58.0,
      minWidth: double.infinity,
      shape: borderEnable
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              // side: BorderSide(
              //     width: 1, color: borderColor ?? AppColor.backgroundColor),
            )
          : null,
      color: color ?? Colors.teal,
      onPressed: onTap,
      child: Center(
          child: !loading
              ? Text(
                  text,
                  style: TextStyle(color: textColor ?? kColorWhite),
                )
              : SizedBox(
                  height: height != null ? height! - 10 : 30.0,
                  width: height != null ? height! - 10 : 30.0,
                  child: const CircularProgressIndicator(
                    color: kColorWhite,
                  ))),
    );
  }
}
