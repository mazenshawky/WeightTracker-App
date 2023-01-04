import 'package:flutter/material.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';

import '../../core/utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.kPrimaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.weightEmpty;
        } else if (!RegExp(r'^[1-9]([0-9]{1,2}$)').hasMatch(value)) {
          return AppStrings.weightInvalid;
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: AppStrings.weight,
        prefixIcon: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.sports_gymnastics),
        ),
      ),
    );
  }
}
