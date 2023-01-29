import 'package:flutter/material.dart';

class IncomingDetailsView extends StatelessWidget {
  const IncomingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(),
              title: Text("Engr Kaka, Director, ITIS"),
              subtitle: Text("To all Unit heads"),
            ),
            const Text("Very long text should be here"),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: ListTile(
                    title: Text('Acknowledgement sent'),
                  )));
                },
                child: const Text("Acknowledge"))
          ],
        ));
  }
}
