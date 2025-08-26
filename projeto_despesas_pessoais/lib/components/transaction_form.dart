import 'package:flutter/material.dart';

import 'package:projeto_despesas_pessoais/components/adaptative_button.dart';
import 'package:projeto_despesas_pessoais/components/adaptative_date_picker.dart';
import 'package:projeto_despesas_pessoais/components/adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 200,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                label: "Título",
                onSubmitted: (_) => _submitForm(),
                controller: _titleController,
              ),
              AdaptativeTextField(
                label: "Valor R\$",
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                controller: _valueController,
              ),
              AdaptativeDatePicker(_selectedDate, (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [AdaptativeButton("Nova Transação", _submitForm)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
