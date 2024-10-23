import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  // A mock list of items in the shopping cart with images
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Ayam Serundeng',
      'quantity': 2,
      'price': 12.99,
      'image':
          'https://akcdn.detik.net.id/visual/2023/06/07/ilustrasi-ayam-serundeng_169.jpeg?w=650',
    },
    {
      'name': 'Ayam Kecap',
      'quantity': 1,
      'price': 8.50,
      'image':
          'https://akcdn.detik.net.id/visual/2021/03/17/ilustrasi-ayam-kecap-1_169.jpeg?w=650&q=80',
    },
    {
      'name': 'Ayam Rendang',
      'quantity': 3,
      'price': 15.00,
      'image':
          'https://akcdn.detik.net.id/visual/2023/04/20/rendang-ayam_169.jpeg?w=650&q=80',
    },
    {
      'name': 'Ayam Suwir',
      'quantity': 1,
      'price': 10.75,
      'image':
          'https://akcdn.detik.net.id/visual/2023/06/08/ayam-suwir_169.jpeg?w=650&q=80',
    },
  ];

  // Function to calculate the total price
  double calculateTotal() {
    return cartItems.fold(0,
        (total, current) => total + (current['price'] * current['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Color.fromARGB(255, 236, 106, 26),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      cartItem['image'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.red,
                            size: 24,
                          ),
                        );
                      },
                    ),
                    title: Text(cartItem['name']),
                    subtitle: Text('Quantity: ${cartItem['quantity']}'),
                    trailing: Text(
                        '\$${(cartItem['price'] * cartItem['quantity']).toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${calculateTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
