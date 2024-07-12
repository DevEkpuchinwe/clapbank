import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white24,
            child: Icon(
              icon,
              color: Colors.deepOrangeAccent,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
