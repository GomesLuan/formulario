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
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Formulário")),
        body: MyFormWidget(),
      )
    );
  }
}

class MyFormWidget extends StatelessWidget {
  MyFormWidget();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Text('Form')
    );
  }
}