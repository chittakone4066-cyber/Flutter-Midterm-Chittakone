import 'package:flutter/material.dart';
import 'package:flutter_midterm/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_midterm/providers/transaction_provider.dart';
import 'package:flutter_midterm/screens/form_screen.dart';
import 'package:flutter_midterm/models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionProvider>(context, listen: false).initData();
    });
  }

  Future<void> _confirmClearAll(
    BuildContext context,
    TransactionProvider provider,
  ) async {
    final bool? shouldClear = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ຢືນຢັນການລ້າງຂໍ້ມູນ'),
          content: const Text('ເຈົ້າແນ່ໃຈ ຫຼື ບໍ່ວ່າຕ້ອງການລົບຂໍ້ມູນທັງໝົດ'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('ຍົກເລີກ'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('ລົບທັງໝົດ'),
            ),
          ],
        );
      },
    );

    if (shouldClear == true) {
      await provider.clearAllTransactions();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ລົບຂໍ້ມູນໃນຖານຂໍ້ມູນທັງໝົດແລ້ວ')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home: (Database)"),
            backgroundColor: Colors.blueAccent,
            actions: [
              IconButton(
                icon: const Icon(Icons.cleaning_services),
                onPressed: () => _confirmClearAll(context, provider),
                tooltip: 'ລ້າງຂໍ້ມູນທັງໝົດ',
              ),
              IconButton(
                icon: const Icon(Icons.add_box_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FormScreen()),
                  );
                },
                tooltip: 'ເພີ່ມລາຍການໃໝ່',
              ),
            ],
          ),
          drawer: AppDrawer(),
          body: provider.transactions.isEmpty
              ? const Center(
                  child: Text(
                    'ຍັງບໍ່ທັນມີລາຍການຂອງທ່ານເທື່ອ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: provider.transactions.length,
                  itemBuilder: (context, index) {
                    final TransactionModel transaction =
                        provider.transactions[index];
                    final priceFormat = NumberFormat(
                      "#,##0.00",
                      "en_US",
                    ).format(transaction.price.abs());
                    final dateFormat = DateFormat(
                      'dd MMM yyyy HH:mm',
                    ).format(transaction.date);
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          transaction.title,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('ວັນທີ: $dateFormat'),
                        trailing: Text(
                          ' \$${priceFormat}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: transaction.price > 0
                                ? Colors.green.shade700
                                : Colors.red.shade700,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
