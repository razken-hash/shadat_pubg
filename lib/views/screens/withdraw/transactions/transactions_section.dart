import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({super.key});

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
