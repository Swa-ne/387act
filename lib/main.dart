import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Spacer(),
              TextField(
                onChanged: bloc.updateFirstInput,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("Num 1: "),
                  prefixStyle: TextStyle(color: Colors.black),
                  hintText: "Number 1",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                onChanged: bloc.updateSecondInput,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("Num 2: "),
                  prefixStyle: TextStyle(color: Colors.black),
                  hintText: "Number 2",
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                  minimumSize: WidgetStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50)),
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  getResult("+");
                },
                child: const Text(
                  "Addition",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                  minimumSize: WidgetStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50)),
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  getResult("-");
                },
                child: const Text(
                  "Subtraction",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                  minimumSize: WidgetStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50)),
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  getResult("*");
                },
                child: const Text(
                  "Multiplication",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                  minimumSize: WidgetStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50)),
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  getResult("/");
                },
                child: const Text(
                  "Division",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              StreamBuilder(
                stream: bloc.result,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(
                    snapshot.hasData ? '${snapshot.data}' : "0",
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

void getResult(opr) async {
  var num1 = bloc.latestFirstInput;
  var num2 = bloc.latestSecondInput;
  switch (opr) {
    case '+':
      bloc.updateResult('${num1 + num2}');
      break;
    case '-':
      bloc.updateResult('${num1 - num2}');
      break;
    case '*':
      bloc.updateResult('${num1 * num2}');
      break;
    default:
      bloc.updateResult('${num1 / num2}');
  }
}
