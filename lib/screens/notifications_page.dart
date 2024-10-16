import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notifications data
    final List<String> notifications = [
      "You have a new message",
      "Your order has been shipped",
      "Don't miss our special sale!",
      "Your friend commented on your post",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.purple),
              title: Text(notifications[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle notification tap (optional)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Notification"),
                    content: Text(notifications[index]),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
