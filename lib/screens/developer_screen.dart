import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Info (ຂໍ້ມູນຜູ້ພັດທະນາ)'),
        backgroundColor: Colors.teal,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/chittakone.jpg'),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Mr.Chittakone',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  letterSpacing: 1.2,
                ),
              ),
              const Text(
                'PHOUANGMIXAY',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 15),
              const Chip(
                label: Text('ນັກສຶກສາ Flutter Developer'),
                avatar: Icon(Icons.code),
                backgroundColor: Color.fromARGB(255, 200, 230, 201),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal.shade200, width: 2),
                ),
                child: const Text(
                  'ສ້າງແອັບນີ້ຂຶ້ນມາເພື່ອຕອບໂຈດການຮຽນໃນຫ້ອງຮຽນ Flutter Mobile Development',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ຍັງບໍ່ທັນໄດ້ຄິດ')),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(
                      Icons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ຍັງບໍ່ທັນໄດ້ຄິດ')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
