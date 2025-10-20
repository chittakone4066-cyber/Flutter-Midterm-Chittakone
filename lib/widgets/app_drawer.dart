import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 12, 102, 177)),
            child: Text(
              'Menu ຫຼັກ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('ໜ້າ Home'),
            onTap: () => _navigateTo(context, '/'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('ໜ້າ Product'),
            onTap: () => _navigateTo(context, '/products'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('ໜ້າ Developer'),
            onTap: () => _navigateTo(context, '/developer'),
          ),
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: 'Demo App',
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2025 ນັກສຶກສາ',
            child: Text('ກ່ຽວກັບແອັບ'),
          ),
        ],
      ),
    );
  }
}
