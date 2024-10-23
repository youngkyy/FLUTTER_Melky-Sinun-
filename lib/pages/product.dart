import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  // A mock list of food products with names, prices, image URLs, and sold count
  final List<Map<String, dynamic>> foodProducts = [
    {
      'name': 'Ayam Serundeng',
      'price': 12.99,
      'sold': 50, // Added sold count
      'image':
          'https://akcdn.detik.net.id/visual/2023/06/07/ilustrasi-ayam-serundeng_169.jpeg?w=650',
    },
    {
      'name': 'Ayam Kecap',
      'price': 8.50,
      'sold': 30, // Added sold count
      'image':
          'https://akcdn.detik.net.id/visual/2021/03/17/ilustrasi-ayam-kecap-1_169.jpeg?w=650&q=80',
    },
    {
      'name': 'Ayam Rendang',
      'price': 15.00,
      'sold': 20, // Added sold count
      'image':
          'https://akcdn.detik.net.id/visual/2023/04/20/rendang-ayam_169.jpeg?w=650&q=80',
    },
    {
      'name': 'Ayam Suwir',
      'price': 10.75,
      'sold': 15, // Added sold count
      'image':
          'https://akcdn.detik.net.id/visual/2023/06/08/ayam-suwir_169.jpeg?w=650&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Color.fromARGB(255, 236, 106, 26),
      ),
      body: ListView.builder(
        itemCount: foodProducts.length,
        itemBuilder: (context, index) {
          final product = foodProducts[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image widget with fallback for errors
                Image.network(
                  product['image'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['name'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '\$${product['price'].toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    'Sold: ${product['sold']}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
