import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.amountCr,
    required this.amountDr,
  }) : super(key: key);

  final String imgUrl;
  final String name;
  final num amountCr;
  final num amountDr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: NetworkImage(imgUrl, scale: 5),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'acc.name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$amountCr Cr',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$amountDr Dr',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}