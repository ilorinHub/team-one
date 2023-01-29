import 'package:edoc/correspondences/minuted_view_details.dart';
import 'package:flutter/material.dart';

class MinutedView extends StatelessWidget {
  const MinutedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ...getMinutes().map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const MinutedView1();
                  }));
                },
                leading: Text('From: ${e.senderName}'),
                title: Text(e.documentTitle),
                subtitle: Text(e.message),
                trailing: Text(DateTime.now().toString()),
              ),
            ))
      ]),
    ));
  }

  List<Minuting> getMinutes() {
    return List.generate(
        19,
        (index) => Minuting(
            documentID: 'KWR/TS/21E/433',
            documentTitle: 'Request for Partnership',
            message: 'Please handle urgently',
            senderName: 'Barr. Chinedu'));
  }
}

class Minuting {
  String documentID;
  String documentTitle;
  String senderName;
  String message;
  Minuting({
    required this.documentID,
    required this.documentTitle,
    required this.senderName,
    required this.message,
  });
}
