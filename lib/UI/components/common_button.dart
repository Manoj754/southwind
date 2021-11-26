import 'package:flutter/material.dart';
import 'package:southwind/UI/theme/apptheme.dart';

class CommonButton extends StatelessWidget {
  final String? lable;
  final VoidCallback? ontap;
  final Color? bgColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Widget? icon;
  final bool? isLeading;
  const CommonButton(
      {this.lable,
      this.textStyle,
      this.borderRadius,
      this.bgColor,
      this.ontap,
      this.isLeading,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = 50;
    final double defaultBorderRadius = 4;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: height,
            decoration: BoxDecoration(
                color: bgColor ?? Colors.white,
                borderRadius:
                    BorderRadius.circular(borderRadius ?? defaultBorderRadius),
                border: Border.all(color: primarySwatch[900]!)),
            child: Center(
                child: icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isLeading!) icon!,
                          Expanded(
                            child: Align(
                              alignment: isLeading!
                                  ? Alignment.lerp(Alignment.center,
                                      Alignment.centerLeft, .4)!
                                  : Alignment.lerp(Alignment.center,
                                      Alignment.centerRight, .4)!,
                              child: Text(
                                lable ?? "Button",
                                style: textStyle ??
                                    Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 18,
                                            color: primarySwatch[900]),
                              ),
                            ),
                          ),
                          if (!isLeading!) icon!,
                        ],
                      )
                    : Text(
                        lable ?? "Button",
                        style: textStyle ??
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 18, color: primarySwatch[900]),
                      )),
          ),
        ),
      ),
    );
  }
}
