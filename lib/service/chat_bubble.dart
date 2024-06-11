import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blueAccent,
      ),
      child: Text(message, style: const TextStyle(fontSize: 16)),
    );
  }
}
