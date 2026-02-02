import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String userNumber;
  final String winNumber;
  final String price;

  const ResultPage({
    super.key,
    required this.userNumber,
    required this.winNumber,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    bool isWin = (userNumber == winNumber);

    double inputPrice = double.tryParse(price) ?? 0;
    double reward = inputPrice * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการซื้อหวย"),
        backgroundColor: isWin ? Colors.green : Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("เลขที่คุณเลือกซื้อ", style: TextStyle(fontSize: 18)),
            Text(
              userNumber,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              "จำนวนเงินที่ซื้อ: $price บาท",
              style: const TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),

            const Divider(height: 40, thickness: 2, indent: 50, endIndent: 50),

            const Text("เลขรางวัลที่ออกคือ", style: TextStyle(fontSize: 18)),
            Text(
              winNumber,
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isWin ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    isWin
                        ? "ยินดีด้วย! คุณถูกรางวัล"
                        : "เสียใจด้วย! คุณไม่ถูกรางวัล",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isWin
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                    ),
                  ),
                  if (isWin)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "คุณได้รับเงินรางวัล: ${reward.toStringAsFixed(0)} บาท!",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.refresh),
              label: const Text("กลับไปซื้อใหม่"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
