import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text('Monthly Income', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text('\$0.00', style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: Center(
                  child: Text('Dashboard Quick Summary will go here.'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ),
    );
  }
}
