// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/request/request.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: must_be_immutable
import '../../../Components/drawer.dart';
import 'components/infoCard.dart';
import 'components/paymentListTile.dart';
import 'style/colors.dart';
import 'style/style.dart';

class Dashboard extends StatefulWidget {
  final String buissnessId;
  Dashboard({super.key, required this.buissnessId});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Future getMethod() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    return (await Request().send("GET",
            "/buissness/buissness/${widget.buissnessId}/expenses/expenseMethod",
            headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "authorization": "Bearer $token",
        }))
        .data;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(child: const Icon(Icons.person), label: "Add Customer"),
          SpeedDialChild(child: const Icon(Icons.category), label: "Add Category"),
          SpeedDialChild(child: const Icon(Icons.attach_money), label: "Add Expense"),
        ],
      ),
      drawer: const MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: const Icon(Icons.calendar_month,
                      color: AppColors.mustard, size: 20),
                  onPressed: () {}),
              const SizedBox(width: 10),
              const SizedBox(width: 15),
              const CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage('assets/images/cardAvatar.png'),
              ),
              const SizedBox(width: 10)
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  PrimaryText(
                                      text: 'Dashboard',
                                      size: 30,
                                      fontWeight: FontWeight.w800),
                                  PrimaryText(
                                    text: 'Payments updates',
                                    size: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondary,
                                  )
                                ]),
                          ),
                        ]),
                        SizedBox(
                          height: height * 4 / 100,
                        ),
                        SizedBox(
                          width: width,
                          child: FutureBuilder(
                              future: getMethod(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  print(snapshot.data);
                                  return Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      InfoCard(
                                          icon: Icons.credit_card_outlined,
                                          label: 'Transafer via \nCard number',
                                          amount: '\$1200'),
                                      InfoCard(
                                          icon: Icons.money_sharp,
                                          label: 'Transafer via \nOnline Banks',
                                          amount: '\$150'),
                                      InfoCard(
                                          icon: Icons.account_balance,
                                          label: 'Transafer \nSame Bank',
                                          amount: '\$1500'),
                                      InfoCard(
                                          icon: Icons.account_balance_wallet,
                                          label: 'Transafer to \nOther Bank',
                                          amount: '\$1500'),
                                    ],
                                  );
                                } else {
                                  return SizedBox(
                                      height: height * 42.55 / 100,
                                      child: const Center(
                                          child: CircularProgressIndicator()));
                                }
                              }),
                        ),
                        SizedBox(
                          height: height * 4 / 100,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15.0,
                                  offset: Offset(
                                    10.0,
                                    15.0,
                                  ),
                                )
                              ]),
                          child: Image.asset('assets/images/card.png'),
                        ),
                        SizedBox(
                          height: width * 15 / 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            PrimaryText(
                                text: 'Recent Activities',
                                size: 18,
                                fontWeight: FontWeight.w800),
                            PrimaryText(
                              text: '02 Mar 2021',
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          child: FutureBuilder(
                              future: Future.delayed(const Duration(seconds: 3),
                                  () {
                                return true;
                              }),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  const recentActivities = [
                                    {
                                      "icon": 'assets/drop.svg',
                                      "label": 'Water Bill',
                                      "amount": "\$120"
                                    },
                                    {
                                      "icon": 'assets/salary.svg',
                                      "label": 'Income Salary',
                                      "amount": "\$4500"
                                    },
                                    {
                                      "icon": 'assets/electricity.svg',
                                      "label": 'Electric Bill',
                                      "amount": "\$150"
                                    },
                                    {
                                      "icon": 'assets/wifi.svg',
                                      "label": 'Internet Bill',
                                      "amount": "\$60"
                                    },
                                  ];
                                  return Column(
                                    children: List.generate(
                                      recentActivities.length,
                                      (index) => PaymentListTile(
                                        icon: Icons.account_balance_wallet,
                                        label: recentActivities[index]
                                                ["label"] ??
                                            '',
                                        amount: recentActivities[index]
                                                ["amount"] ??
                                            '',
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                      height: height * 42.55 / 100,
                                      child: const Center(
                                          child: CircularProgressIndicator()));
                                }
                              }),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
