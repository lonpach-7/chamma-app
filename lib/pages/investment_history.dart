import 'package:flutter/material.dart';

class InvestmentHistoryPage extends StatelessWidget {
  const InvestmentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Investment History"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _historyItem("Tech Stocks", "15 Nov", "+\$1,200.00", Colors.green),
          _historyItem("Real Estate", "01 Nov", "-\$500.00", Colors.red),
          _historyItem("Cryptocurrency", "20 Oct", "+\$300.00", Colors.green),
          _historyItem("Savings Bonds", "15 Oct", "-\$200.00", Colors.red),
        ],
      ),
    );
  }

  // History Item Widget
  Widget _historyItem(String title, String date, String amount, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.withOpacity(0.2),
          child: Icon(Icons.attach_money, color: Colors.deepPurple),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
