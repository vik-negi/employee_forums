import 'package:flutter/material.dart';

class IconNotification extends StatelessWidget {
  int no = 3;
  IconData icon;
  Function()? onPressed;
  IconNotification({
    Key? key,
    required this.no,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            icon: Icon(
              icon,
            ),
            onPressed: () {
              if (onPressed != null) {
                onPressed!();
              }
            }),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              '$no',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
