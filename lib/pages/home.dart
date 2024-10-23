import 'package:flutter/material.dart';
import 'package:appflutter/halaman/bisnis1.dart';
import 'package:appflutter/halaman/history1.dart';
import 'package:appflutter/halaman/shoppingcart1.dart';

// HomePage widget
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // List of food products with names, prices, images, and sold count
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
      'sold': 30, 
      'image':
          'https://akcdn.detik.net.id/visual/2021/03/17/ilustrasi-ayam-kecap-1_169.jpeg?w=650&q=80',
    },
    {
      'name': 'Ayam Rendang',
      'price': 15.00,
      'sold': 20, 
      'image':
          'https://akcdn.detik.net.id/visual/2023/04/20/rendang-ayam_169.jpeg?w=650&q=80',
    },
    {
      'name': 'Ayam Suwir',
      'price': 10.75,
      'sold': 15, 
      'image':
          'https://akcdn.detik.net.id/visual/2023/06/08/ayam-suwir_169.jpeg?w=650&q=80',
    },
  ];

  // Function to load the product image using Image.network with error handling
  Widget loadProductImage(String imageUrl) {
    return Image.network(
      imageUrl,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // Image with a background
            Container(
              color: const Color.fromARGB(255, 236, 106, 26),
              child: Center(
                child: Image.network(
                  'https://marketplace.canva.com/EAD-1TUtqIw/1/0/1600w/canva-video-16%3A9-bisnis-makanan-restoran-rumahan-sederhana-oranye-dan-putih-RQnAJD4qykQ.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Button row for History, Shopping Cart, and Business
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // History button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 106, 26),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.history,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  // Shopping cart button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCartPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 106, 26),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  // Business button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 106, 26),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.business,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Add some space between sections
            // Display the list of food products
            Expanded(
              child: ListView.builder(
                itemCount: foodProducts.length,
                itemBuilder: (context, index) {
                  final product = foodProducts[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        loadProductImage(product['image']),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${product['price'].toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        // Display sold count
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Sold: ${product['sold']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
