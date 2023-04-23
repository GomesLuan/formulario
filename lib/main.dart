import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

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
  List<bool?> checkBoxesValues = [false, false, false, false];
  RadioBoxOptions? radioBoxGroup= RadioBoxOptions.nao;

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
              hintText: 'Telefone:',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite algo';
              }
              return null;
            }
          ),
          Text('Idade'),
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
          ),
          Text('Monte seu almoço'),
          CheckboxListTile(
            title: Text('Arroz'),
            value: checkBoxesValues[0], 
            onChanged: (bool? value) {
              setState(() {
                checkBoxesValues[0] = value;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text('Feijão'),
            value: checkBoxesValues[1], 
            onChanged: (bool? value) {
              setState(() {
                checkBoxesValues[1] = value;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text('Frango'),
            value: checkBoxesValues[2], 
            onChanged: (bool? value) {
              setState(() {
                checkBoxesValues[2] = value;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text('Salada'),
            value: checkBoxesValues[3], 
            onChanged: (bool? value) {
              setState(() {
                checkBoxesValues[3] = value;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Text('Vai querer sobremesa?'),
          RadioListTile(
            title: Text('Sim'),
            value: RadioBoxOptions.sim, 
            groupValue: radioBoxGroup, 
            onChanged: (RadioBoxOptions? value) {
              setState(() {
                radioBoxGroup = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Não'),
            value: RadioBoxOptions.nao, 
            groupValue: radioBoxGroup, 
            onChanged: (RadioBoxOptions? value) {
              setState(() {
                radioBoxGroup = value;
              });
            },
          )
        ],
      )
    );
  }
}

enum RadioBoxOptions {sim, nao}