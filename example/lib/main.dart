import 'package:flutter/material.dart';
import 'package:my_input_component/my_input_component.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InputComponent<String>(
                  onChanged: (v) {
                    //do onchange
                  },
                  positionLabel: PositionLabel.top,
                  label: "Input Text",
                  hint: "Input Text",
                  lastDate: DateTime.now(),
                  isRequired: true,
                  defaultErrorText: "Please fill",
                ),
                InputComponent<DateTime>(
                  onChanged: (v) {
                    //do onchange
                  },
                  positionLabel: PositionLabel.top,
                  label: "Input Date",
                  hint: "Input Date",
                  lastDate: DateTime.now(),
                  isRequired: true,
                  defaultErrorText: "Please fill",
                ),
                InputComponent<int>(
                  onChanged: (v) {
                    //do onchange
                  },
                  positionLabel: PositionLabel.top,
                  label: "Input Number",
                  hint: "Input Number",
                  lastDate: DateTime.now(),
                  isRequired: true,
                  defaultErrorText: "Please fill",
                ),
                InputComponent<int>(
                  onChanged: (v) {
                    //do onchange
                  },
                  positionLabel: PositionLabel.top,
                  label: "Input Number",
                  hint: "Input Number Min 10 max 100",
                  lastDate: DateTime.now(),
                  isRequired: true,
                  defaultErrorText: "Please fill",
                  validator: (v) {
                    if (v < 10 || v > 100) {
                      return "Value must be between 10 and 100";
                    }
                    return null;
                  },
                ),
                InputComponent<double>(
                  onChanged: (v) {
                    //do onchange
                  },
                  positionLabel: PositionLabel.top,
                  label: "Input decimal",
                  hint: "Input decimal",
                  lastDate: DateTime.now(),
                  isRequired: true,
                  defaultErrorText: "Please fill",
                ),
                InputComponent<double>(
                  onChanged: (v) {
                    //do onchange
                  },
                  positionLabel: PositionLabel.top,
                  label: "Input decimal for currency",
                  hint: "Input decimal for currency",
                  lastDate: DateTime.now(),
                  decimalDigits: 0,
                  isRequired: true,
                  defaultErrorText: "Please fill",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              //do submit
            }
          },
          child: const Text("Submit"),
        ),
      ),
    );
  }
}
