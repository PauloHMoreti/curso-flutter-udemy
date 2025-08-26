import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  const AdaptativeDatePicker(this.selectedDate, this.onDateChange, {super.key});

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        onDateChange(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange,
            ),
          )
        : Row(
            children: [
              Expanded(
                child: Text(
                  "Data Selecionada: ${DateFormat("dd/mm/y").format(selectedDate)}",
                ),
              ),
              TextButton(
                onPressed: () => _showDatePicker(context),
                child: Text(
                  "Selecionar Data",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          );
  }
}
