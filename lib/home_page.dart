import 'package:calculator/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  String text = '';

  //For new cvv text field
  final numberFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'[0-9]'),
  );
  final lengthFormatter = LengthLimitingTextInputFormatter(3);
  late final FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DemoDay 2"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (String value) {
                setState(() {
                  text = controller.text;
                });
              },
            ),
            Text(text),
            const SizedBox(
              height: 20,
            ),
            //CVV textField
            TextField(
              focusNode: myFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [numberFormatter, lengthFormatter],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'CVV',
              ),
            ),
            ElevatedButton(onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomForm()))
            }, child: const Text("Go to form"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => myFocusNode.requestFocus()),
    );
  }
}
