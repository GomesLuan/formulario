import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Formulário")),
        body: MyFormWidget(),
      )
    );
  }
}

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  MyFormWidgetState createState() => MyFormWidgetState();
}

class MyFormWidgetState extends State<MyFormWidget> {
  final formKey = GlobalKey<FormState>();
  double currentSliderValue = 18;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nome:',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite algo';
              }
              return null;
            }
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'CPF:',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite algo';
              }
              return null;
            }
          ),
          Slider(
            value: currentSliderValue,
            min: 18,
            max: 100,
            divisions: 82,
            label: currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                currentSliderValue = value;
              });
            },
          )
        ],
      )
    );
  }
}