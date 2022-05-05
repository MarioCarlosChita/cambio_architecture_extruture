import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTextField(String label, String prefix, TextEditingController c, Function f) {
  return TextField(
      controller: c,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, width: 1.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          prefixText: prefix),
      onChanged: (value) {
        f(value);
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(color: Colors.amber)
  );
}