import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // create a key for form, here is one GlobalKey
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Test"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text here',
              ),
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (value) {
                print("First text $value");
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // validate the form and then proceed. Exclamation is casts from non nullablt to nullable type
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {},
                        textColor: Colors.white,
                      ),
                      content: const Text('Processing Data'),
                      backgroundColor: const Color.fromARGB(255, 26, 160, 115),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
