import 'package:flutter/material.dart';
import 'package:flutter_midterm/models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Center(child: Image.network(product.image, width: 280, height: 280)),
          Text(
            product.category,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 111, 157, 58),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(product.description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Add: ${product.title}')),
                    );
                  },
                  child: Text('Buy'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
