

## Usage
<img src="https://i.stack.imgur.com/8kpc3.png">


A FormField that contains a TextField.
 ```dart
 TextFormField(
  decoration: const InputDecoration(
    icon: Icon(Icons.person),
    hintText: 'What do people call you?',
    labelText: 'Name *',
  ),
  onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
  },
  validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;

 ```


## Resources
- [Documentation](https://api.flutter.dev/flutter/material/TextFormField-class.html)

- [Pub Package](https://pub.dev/packages/textformfieldcustom)
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
