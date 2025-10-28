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
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('ໜ້າ product'),
            onTap: () => _navigateTo(context, '/products'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('ໜ້າ developer'),
            onTap: () => _navigateTo(context, '/developer'),
          ),
          const Divider(),
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
