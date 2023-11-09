import 'package:flutter/material.dart';

class WidgetTesting extends StatefulWidget {
  // extends GetView<WidgetTestingPageController> {
  const WidgetTesting({super.key});

  @override
  State<WidgetTesting> createState() => _WidgetTestingState();
}

class _WidgetTestingState extends State<WidgetTesting> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Test Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                    label: Text('Label text'), hintText: 'Hint text'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Email field required';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  formKey.currentState!.validate();
                },
                child: const Text('Validate')),
            const Divider(),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  label: Text('Widget test for the First name & last name')),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    nameController.text = 'Mukund' + ' ' + 'Pradhan';
                  });
                },
                child: const Text('Show name'))
          ],
        ),
      ),
    );
  }
}
