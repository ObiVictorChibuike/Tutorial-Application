import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final double? btnHeight;
  final double? btnWidth;
  final Color? btnColor;
  final double? btnRadius;
  final Widget? btnIcon;
  const GenericButton({super.key, this.btnHeight, this.btnWidth, this.btnColor, this.btnRadius, this.btnIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  btnHeight ?? 50,
      width: double.infinity,
      decoration: BoxDecoration(color: btnColor ?? Colors.blue, borderRadius: BorderRadius.circular(btnRadius ?? 8)),
      child: Center(
        child: btnIcon ?? Text(""),
      ),
    );
  }
}
