import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:view_ref/extensions.dart';

// Mixin: Tarih seçici, tarih formatlayıcı ve label widget
mixin LeaveFormMixin {
  Future<void> selectDate(
    BuildContext context,
    DateTime? initialDate,
    Function(DateTime) onDateSelected,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) onDateSelected(picked);
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd.MM.yyyy').format(date);
  }

  Widget buildLabel(BuildContext context, String text, {EdgeInsets? padding}) {
    final pad = padding ?? EdgeInsets.only(bottom: context.lowValue);
    return Padding(
      padding: pad,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.defaultValue.clampFont(13, 15),
        ),
      ),
    );
  }
}