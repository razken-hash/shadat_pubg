import 'package:flutter/material.dart';

import 'package:shadat_pubg/views/screens/withdraw/transactions/transactions_section.dart';
import 'package:shadat_pubg/views/screens/withdraw/withdraw/withdraw_section.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String selectedMenu = "withdraw";

  @override
  Widget build(BuildContext context) {
    return PubgScaffold(
      backgroundImage: "pubg_3",
      content: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: PubgColors.whiteColor.withOpacity(.7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Column(
                children: [
                  Text(
                    "السحب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: PubgColors.blackColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "رصيدك الحالي: 100 شدة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: PubgColors.blackColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              height: 500,
              decoration: BoxDecoration(
                color: PubgColors.whiteColor.withOpacity(.7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedMenu = "withdraw";
                              });
                            },
                            child: ColoredBox(
                              color: selectedMenu == "withdraw"
                                  ? PubgColors.primaryColor
                                  : PubgColors.primaryColor.withOpacity(.5),
                              child: const Center(
                                child: Text(
                                  "السحب",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedMenu = "transactions";
                              });
                            },
                            child: ColoredBox(
                              color: selectedMenu == "transactions"
                                  ? PubgColors.primaryColor
                                  : PubgColors.primaryColor.withOpacity(.5),
                              child: const Center(
                                child: Text(
                                  "المعاملات",
                                  style: TextStyle(
                                    color: PubgColors.whiteColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: selectedMenu == "withdraw"
                        ? const WithdrawSection()
                        : const TransactionsSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
