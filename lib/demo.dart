import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: 'One',
          items:
              [
                'One',
                'Two',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (_) {},
        ),
      ),
    ),
  ),
);
