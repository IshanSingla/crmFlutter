import 'package:flutter/material.dart';
import '../../../main.dart';

class customCards extends StatelessWidget {
  const customCards({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buissnessId = name;
        print(buissnessId);
        // Navigator.pushNamed(context, '/buissness/dashbord');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 156,
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
                child: const Image(
                  image: AssetImage('assets/images/cardAvatar.png'),
                  height: 90,
                  width: 90,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
