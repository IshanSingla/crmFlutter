import 'package:flutter/material.dart';

import 'components/search_bar.dart';
import 'Components/Card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------- heading Section
            const Padding(
              padding: EdgeInsets.only(top: 30.0, left: 10.0),
              child: Text(
                'Businesses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),

            //------------ underline Section
            Container(
              height: 5,
              width: size.width * 0.5,
              color: const Color.fromRGBO(239, 193, 124, 1.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width,
                height: size.height * 0.75,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(239, 193, 124, 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SearchBar(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Cards(
                            imgUrl:
                                'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295396__480.png',
                            name: 'acc.name',
                            amountCr: 100,
                            amountDr: 100,
                          ),
                          Cards(
                            imgUrl:
                                'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295396__480.png',
                            name: 'acc.name',
                            amountCr: 100,
                            amountDr: 100,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Cards(
                            imgUrl:
                                'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295396__480.png',
                            name: 'acc.name',
                            amountCr: 100,
                            amountDr: 100,
                          ),
                          Cards(
                            imgUrl:
                                'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295396__480.png',
                            name: 'acc.name',
                            amountCr: 100,
                            amountDr: 100,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Cards(
                            imgUrl:
                                'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295396__480.png',
                            name: 'acc.name',
                            amountCr: 100,
                            amountDr: 100,
                          ),
                          Cards(
                            imgUrl:
                                'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295396__480.png',
                            name: 'acc.name',
                            amountCr: 100,
                            amountDr: 100,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
