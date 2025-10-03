import 'package:flutter/material.dart';
import 'package:actividad_de_clase_01/counter_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Atómico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador Atómico'),
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
  int _counter = 0;

  final _amountController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _addAmount() {
    final amount = int.tryParse(_amountController.text) ?? 0;
    setState(() => _counter += amount);
    _amountController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const Spacer(),
          _CounterDisplay(counter: _counter),
          const SizedBox(height: 20),
          CounterActions(
            onIncrement: _incrementCounter,
            onDecrement: _decrementCounter,
          ),
          const Spacer(),
          AddAmountForm(controller: _amountController, onAdd: _addAmount),
        ],
      ),
    );
  }
}

class _CounterDisplay extends StatelessWidget {
  final int counter;

  const _CounterDisplay({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Valor actual del contador:'),
        Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
