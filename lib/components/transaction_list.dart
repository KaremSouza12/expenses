import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactinList extends StatelessWidget {
  const TransactinList({
    super.key,
    required this.transaction,
    required this.onRemove,
  });

  final List<Transaction> transaction;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transaction.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            })
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                final e = transaction[index];
                return TransactionItem(e: e, onRemove: onRemove);
              },
            ),
    );
  }
}
