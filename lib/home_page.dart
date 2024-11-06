import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  String text = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DemoDay 1"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (String value){
                setState(() {
                  text = controller.text;
                });
              },
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
