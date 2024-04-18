import 'package:final_project/src/sample_feature/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OC Bot'),
      ),
      body: const ChatWidget(),
    );
  }
}
