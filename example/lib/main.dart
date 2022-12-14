import 'package:flutter/material.dart';
import 'package:textformfieldcustom/textformfieldcustom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Text Field'),
        ),
        body: Column(
          children: const [
            CustomTextfield(
              label: 'Borey zin2 Boy Lozz ',
              hint: 'Borey zin2 Boy Lozz ',
            )
          ],
        ));
  }
}
