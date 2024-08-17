// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:shadat_pubg/views/config/assets_manager.dart';
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
                        ? const WithdrawMenu()
                        : const TransactionsScreen(),
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

class WithdrawTile extends StatelessWidget {
  final int value;
  const WithdrawTile({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: PubgColors.primaryColor.withOpacity(.5),
      ),
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  width: 60,
                  fit: BoxFit.fitWidth,
                  AssetsManager.getImage("golden_box"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    "$value",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 130,
              color: PubgColors.primaryColor,
              child: const Center(
                child: Text(
                  "سحب",
                  style: TextStyle(
                    color: PubgColors.whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WithdrawMenu extends StatelessWidget {
  const WithdrawMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WithdrawTile(
          value: 500,
        ),
        SizedBox(height: 10),
        WithdrawTile(
          value: 1000,
        ),
        SizedBox(height: 10),
        WithdrawTile(
          value: 1500,
        ),
      ],
    );
  }
}

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  Future<List<String>> loadTransactions() async {
    await Future.delayed(const Duration(seconds: 2));
    return ["HI", "Hello"];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: loadTransactions(),
      builder: (context, snapshot) {
        print(snapshot);
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            List<String> transactions = snapshot.data ?? [];
            transactions.isEmpty
                ? const Center(
                    child: Text(
                      "لا يوجد معاملات",
                      style: TextStyle(
                        color: PubgColors.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const Column(
                    children: [],
                  );
          default:
            return const Center(
              child: Text(
                "حدث خطأ أثناء تحjjميل المعاملات",
                style: TextStyle(
                  color: PubgColors.blackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
        }
        return const Center(
          child: Text(
            "حدث خطأ أثناء تحميل المعاملات",
            style: TextStyle(
              color: PubgColors.blackColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
