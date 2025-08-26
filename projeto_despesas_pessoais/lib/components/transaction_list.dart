import 'package:flutter/material.dart';
import '../models/trasaction.dart';
import 'package:intl/intl.dart';

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

              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(child: Text("R\$ ${tr.value}")),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  subtitle: Text(
                    DateFormat('d/MM/y').format(tr.date),
                    style: TextStyle(color: Colors.blueGrey),
                    textAlign: TextAlign.left,
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          label: Text(
                            "Excluir",
                            style: TextStyle(color: Colors.red),
                          ),
                          icon: Icon(Icons.delete, color: Colors.red),
                        )
                      : IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                ),
              );
            },
          );
  }
}
