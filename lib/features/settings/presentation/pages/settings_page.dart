import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Budget Settings'),
            subtitle: Text('Manage categories and allocations'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English'),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Theme'),
            subtitle: Text('System Default'),
          ),
        ],
      ),
    );
  }
}
