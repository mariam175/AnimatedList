import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController control;
  final String label;
  final IconData icon;
  final TextInputType keyboardtype;
  final String? Function(String?)? valid;
  const TextInput(
      {super.key,
      required this.control,
      required this.label,
      required this.icon,
      required this.keyboardtype,
      required this.valid});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
          prefixIcon: Icon(icon)),
      keyboardType: keyboardtype,
      validator: valid,
    );
  }
}
