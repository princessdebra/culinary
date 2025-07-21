import 'package:flutter/material.dart';

void main() {
  runApp(const MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide a fixed theme based on your preference
    final ThemeData theme = ThemeData.light();

    return MaterialApp(
      title: 'Recipe App',
      theme: theme,
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notification Preferences'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPreferencesScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Account Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  _NotificationPreferencesScreenState createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends State<NotificationPreferencesScreen> {
  bool receiveRecipeNotifications = true;
  bool receiveNewsletters = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Preferences'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Receive Recipe Notifications'),
            value: receiveRecipeNotifications,
            onChanged: (bool value) {
              setState(() {
                receiveRecipeNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Receive Newsletters'),
            value: receiveNewsletters,
            onChanged: (bool value) {
              setState(() {
                receiveNewsletters = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Change Password'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/registartion');
              // Navigate to Change Password screen
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/login');
              // Perform logout action
            },
          ),
        ],
      ),
    );
  }
}