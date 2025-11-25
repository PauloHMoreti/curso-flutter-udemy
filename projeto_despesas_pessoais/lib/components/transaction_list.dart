import 'package:flutter/material.dart';
import 'package:projeto_despesas_pessoais/components/transaction_item.dart';
import '../models/trasaction.dart';

class TransactionList extends StatelessWidget {
  //Constantes:
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  //Construtor:
  const TransactionList(this.transactions, this.onRemove, {super.key});

  //Widget:
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                Text(
                  "Nenhuma Transação Cadastrada",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, idx) {
              final tr = transactions[idx];

              return TransactionItem(tr: tr, onRemove: onRemove);
            },
          );
  }
}


