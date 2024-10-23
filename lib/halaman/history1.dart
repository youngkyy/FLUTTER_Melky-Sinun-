import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  // A mock list of food purchase history with updated product names
  final List<Map<String, String>> purchaseHistory = [
    {
      'date': '2024-10-20',
      'item': 'Ayam Serundeng',
      'price': '\$12.99',
    },
    {
      'date': '2024-09-15',
      'item': 'Ayam Kecap',
      'price': '\$8.50',
    },
    {
      'date': '2024-08-10',
      'item': 'Ayam Rendang',
      'price': '\$15.00',
    },
    {
      'date': '2024-07-05',
      'item': 'Ayam Suwir',
      'price': '\$10.75',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Purchase History'),
        backgroundColor: Color.fromARGB(255, 236, 106, 26),
      ),
      body: ListView.builder(
        itemCount: purchaseHistory.length,
        itemBuilder: (context, index) {
          final historyItem = purchaseHistory[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(historyItem['item']!),
              subtitle: Text('Purchased on: ${historyItem['date']}'),
              trailing: Text(historyItem['price']!),
            ),
          );
        },
      ),
    );
  }
}
