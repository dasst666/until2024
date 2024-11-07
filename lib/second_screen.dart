import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              //Логика Валидации
              //Todo надо лайв логику написать
              validator: (value) {
                if (value == null || value.length < 10) {
                  return "Low safety password";
                }
                return null;
              },
            )
          ],
        ),
      ),
      //Валидация пароля по нажатию на кнопку
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.back_hand),
        onPressed: () => {if (_formKey.currentState?.validate() ?? false) {}},
      ),
    );
  }
}
