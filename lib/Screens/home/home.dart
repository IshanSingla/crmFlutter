import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/request/request.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// Importing the utils
import '../../Components/drawer.dart';
import '../../utils/colors.dart';
import 'components/search_bar.dart';
import 'Components/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget buildCard(List data) {
    Size size = MediaQuery.of(context).size;
    bool dataFound = false;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: SearchBar(),
        ),
        (data).isEmpty
            ? SizedBox(
                height: size.height * 0.67,
                child: const Center(
                    child: Text(
                  'No Buissness Found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              )
            : Column(
                children: data
                    .asMap()
                    .entries
                    .map((entry) {
                      int idx = entry.key;
                      String val = entry.value;
                      if (dataFound) {
                        dataFound = false;
                        return Container();
                      } else if ((idx + 1) % 2 == 0) {
                        dataFound = true;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customCards(
                              name: data[idx],
                            ),
                            customCards(
                              name: data[idx + 1],
                            )
                          ],
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            customCards(
                              name: val,
                            ),
                          ],
                        );
                      }
                    })
                    .toList()
                    .reversed
                    .toList(),
              ),
      ],
    );
  }

  Future<Map> getData() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    var data = await Request().send("GET", "/buissness", headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "authorization": "Bearer $token",
    });
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/login");
            },
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
                  color: MyColors.mustard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder(
                      future: getData(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return buildCard(snapshot.data!['buissness'] as List);
                        } else {
                          return SizedBox(
                            height: size.height * 0.75,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                    )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            label: "Add Buissness",
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.business)),
          ),
        ],
      ),
    );
  }
}
