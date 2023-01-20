import 'package:flutter/material.dart';

class customSearch extends StatelessWidget {
  final double fem;
  final double ffem;
  const customSearch({super.key, required this.fem, required this.ffem});

  @override
  Widget build(BuildContext context) {
    return Container(
      // autogroup49vymHq (JYNs7yE2YS2AYueXUg49Vy)
      margin: EdgeInsets.fromLTRB(
          0 * fem, 0 * fem, 0 * fem, 28 * fem),
      padding: EdgeInsets.fromLTRB(
          272 * fem, 9 * fem, 16 * fem, 10 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffe1e1e1)),
        color: Color(0x4900a9ff),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: Align(
        // searchrq5 (37:5)
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 20 * fem,
          height: 19 * fem,
          child: IconButton(icon: const Icon(Icons.search), onPressed: () {  },),
        ),
      ),
    );
  }
}