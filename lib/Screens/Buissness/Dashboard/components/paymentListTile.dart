// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/style.dart';

class PaymentListTile extends StatelessWidget {
  final String label;
  final String amount;
  final IconData icon;

  PaymentListTile({super.key, required this.label, required this.amount, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,
      leading: Container(
          width: 50,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Icon(
            icon,
            color: AppColors.primary,
          )),
      title:
          PrimaryText(text: label , size: 14, fontWeight: FontWeight.w500),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: 'Successfully',
            size: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.iconGray,
          ),
          PrimaryText(
              text: amount, size: 16, fontWeight: FontWeight.w600),
        ],
      ),
      onTap: () {
        print('tap');
      },
      selected: true,
    );
  }
}
