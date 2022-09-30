## Example
```dart
import 'package:cic_clone/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomTextfield(
            label: 'Name',
          ),
          CustomTextfield(
            label: 'Date Of Birth',
            onDateTimeChanged: (v) {},
          )
        ],
      ),
    );
  }
}
```