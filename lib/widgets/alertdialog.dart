import 'package:flutter/material.dart';

Widget showDialog(String data, BuildContext context) {
  return AlertDialog(
    title: const Text('Error'),
    // ignore: avoid_unnecessary_containers
    content: Container(
      child: Text(data),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close))
    ],
  );
}
