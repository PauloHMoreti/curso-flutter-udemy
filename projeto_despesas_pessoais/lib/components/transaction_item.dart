import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_despesas_pessoais/models/trasaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.tr, required this.onRemove});

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
                label: Text("Excluir", style: TextStyle(color: Colors.red)),
                icon: Icon(Icons.delete, color: Colors.red),
              )
            : IconButton(
                onPressed: () => onRemove(tr.id),
                icon: Icon(Icons.delete, color: Colors.red),
              ),
      ),
    );
  }
}
