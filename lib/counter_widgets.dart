import 'package:flutter/material.dart';

class CounterActions extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterActions({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          iconSize: 40,
          onPressed: onDecrement,
          tooltip: 'Restar',
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          iconSize: 40,
          onPressed: onIncrement,
          tooltip: 'Sumar',
        ),
      ],
    );
  }
}

class AddAmountForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const AddAmountForm({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad a sumar',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onAdd,
            child: const Text('Añadir'),
          ),
        ],
      ),
    );
  }
}