import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //user entered values
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();

  int _result = 0;

  //methods
  void add() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;

      _result = number1 + number2;
    });
  }

  void subtraction() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;
      _result = number1 - number2;
    });
  }

  void multiplication() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;
      _result = number1 * number2;
    });
  }

  void division() {
    int number1 = int.tryParse(_number1Controller.text) ?? 0;
    int number2 = int.tryParse(_number2Controller.text) ?? 0;
    double ans = number1 / number2;
    _result = ans.ceil();
  }

  @override
  void dispose() {
    _number1Controller.dispose();
    _number1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, size: 30),
          title: const Text(
            "Mini Calculator",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _number1Controller,
                decoration: InputDecoration(
                  hintText: "First Number Here...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _number2Controller,
                decoration: InputDecoration(
                  hintText: "Second Number Here...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(_result.toString(), style: TextStyle(fontSize: 40)),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    add();
                  });
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    subtraction();
                  });
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    multiplication();
                  });
                },
                child: Icon(Icons.close),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    division();
                  });
                },
                child: Text("/", style: TextStyle(fontSize: 22)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
