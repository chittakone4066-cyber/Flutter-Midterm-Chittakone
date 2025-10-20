import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {'name': 'ໂທລະສັບ', 'price': '1,500,000 ກີບ', 'icon': Icons.phone_android},
    {
      'name': 'ຄອມພິວເຕີ',
      'price': '4,500,000 ກີບ',
      'icon': Icons.laptop_chromebook,
    },
    {'name': 'ຫູຟັງ', 'price': '250,000 ກີບ', 'icon': Icons.headset},
    {'name': 'ໂມງ', 'price': '800,000 ກີບ', 'icon': Icons.watch},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List (ລາຍການສິນຄ້າ)'),
        backgroundColor: Colors.green,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ທ່ານກົດ ${products[index]['name']}'),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      products[index]['icon'] as IconData,
                      size: 60,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      products[index]['name'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      products[index]['price'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
