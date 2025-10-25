import 'package:flutter/material.dart';
import 'package:flutter_midterm/models/transaction.dart';
import 'package:flutter_midterm/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ເພີ່ມລາຍການ"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "ຊື່ລາຍການ",
                    border: OutlineInputBorder(),
                  ),
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາປ້ອນຊື່ລາຍການ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "ລາຄາ (ລົບ: ລາຍຈ່າຍ, ບວກ: ລາຍຮັບ)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາປ້ອນລາຄາ";
                    }
                    if (double.tryParse(value) == null) {
                      return "ກະລຸນາປ້ອນຄ່າເປັນຕົວເລກທີ່ຖືກຕ້ອງ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "ບັນທຶກຂໍ້ມູນ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final title = titleController.text;
                        final price = double.parse(priceController.text);
                        final date = DateTime.now();

                        final statement = TransactionModel(
                          title: title,
                          price: price,
                          date: date,
                        );

                        Provider.of<TransactionProvider>(
                          context,
                          listen: false,
                        ).addTransaction(statement).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('ບັນທຶກຂໍ້ມູນ $title ແລ້ວ')),
                          );
                          Navigator.pop(context);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
