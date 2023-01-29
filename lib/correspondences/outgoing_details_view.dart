import 'package:flutter/material.dart';

class OutgoingDetailsView extends StatelessWidget {
  const OutgoingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(),
              title: Text("to: All Junior Software Engineers II"),
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
