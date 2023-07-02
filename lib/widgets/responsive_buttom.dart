import 'package:cubit_app/utils/colors.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResposive;
  final double? width;

  const ResponsiveButton({super.key, this.width = 120, this.isResposive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.mainColor),
        width: isResposive == true ? double.maxFinite : width,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: isResposive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              isResposive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const AppText(
                        text: 'Book trip now',
                        color: AppColors.buttonBackgroud,
                      ))
                  : Container(),
              Image.asset(
                'assets/images/next_button.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
