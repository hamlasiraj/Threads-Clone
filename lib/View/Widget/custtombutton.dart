import 'package:flutter/material.dart';

import '../../Core/Constant/appcolors.dart';

class CusttomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String hint;
  const CusttomButton({super.key, required this.onPressed, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        onPressed: onPressed,
        textColor: AppColor.titleText,
        color: AppColor.background,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.smallText),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(hint, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
