import 'package:flutter/material.dart';
import 'withdraw_investment.dart';
import 'investment_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Portfolio Manager",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Portfolio Balance Section
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Portfolio Value",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "\$25,678.90",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddInvestmentPage()),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text(
                              "Add Investment",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WithdrawInvestmentPage()),
                              );
                            },
                            icon: const Icon(Icons.remove, color: Colors.white),
                            label: const Text(
                              "Withdraw",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Quick Actions Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _quickAction(Icons.add_chart, "New Investment", context),
                  _quickAction(Icons.analytics, "Analytics", context),
                  _quickAction(Icons.history, "History", context),
                ],
              ),

              const SizedBox(height: 20),

              // Recent Transactions
              const Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _transactionItem(
                  "Tech Stocks", "15 Nov", "+\$1,200.00", Colors.green),
              _transactionItem(
                  "Real Estate", "01 Nov", "-\$500.00", Colors.red),
              _transactionItem(
                  "Cryptocurrency", "20 Oct", "+\$300.00", Colors.green),
              _transactionItem(
                  "Savings Bonds", "15 Oct", "-\$200.00", Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  // Quick Action Widget
  Widget _quickAction(IconData icon, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == "History") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InvestmentHistoryPage()),
          );
        }
        // Handle other actions
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurple,
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Transaction Item Widget
  Widget _transactionItem(
      String title, String date, String amount, Color color) {
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

class AddInvestmentPage extends StatelessWidget {
  const AddInvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Investment")),
      body: Center(child: const Text("Add Investment Page")),
    );
  }
}
