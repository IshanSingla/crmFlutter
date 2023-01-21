// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/style.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String amount;
  final IconData icon;

  InfoCard({super.key, required this.label, required this.amount, required this.icon});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minWidth: width / 2 - 40),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.iconGray,
            size: 20,
          ),
          SizedBox(
            height: height * 2 / 100,
          ),
          PrimaryText(text: label, color: AppColors.secondary, size: 16),
          SizedBox(
            height: height * 2 / 100,
          ),
          PrimaryText(
            text: amount,
            size: 18,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
