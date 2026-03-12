import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../expenses/domain/entities/budget_category.dart';
import '../../../expenses/presentation/providers/categories_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  void _showAddCategoryDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Category'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Category Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                ref.read(categoriesProvider.notifier).addCategory(
                      BudgetCategory(
                        id: const Uuid().v4(),
                        name: name,
                        percentageAllocation: 0,
                        colorHex: '#9E9E9E',
                        iconName: 'category',
                      ),
                    );
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Budget Categories',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          categoriesAsync.when(
            data: (categories) {
              if (categories.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No categories.'),
                );
              }
              return Column(
                children: categories.map((c) {
                  return ListTile(
                    leading: Icon(
                      c.iconName == 'restaurant'
                          ? Icons.restaurant
                          : c.iconName == 'directions_car'
                              ? Icons.directions_car
                              : c.iconName == 'home'
                                  ? Icons.home
                                  : Icons.category,
                    ),
                    title: Text(c.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(categoriesProvider.notifier).deleteCategory(c.id);
                      },
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, st) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error: $e'),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => _showAddCategoryDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Add Category'),
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English (Placeholder)'),
          ),
          const ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Theme'),
            subtitle: Text('System Default (Placeholder)'),
          ),
        ],
      ),
    );
  }
}
