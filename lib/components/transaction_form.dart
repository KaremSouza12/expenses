import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({
    super.key,
    required this.onSubmit,
  });

  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  onSubmited() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => onSubmited(),
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmited(),
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor R\$'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: onSubmited,
                    child: const Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
