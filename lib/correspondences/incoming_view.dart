import 'package:edoc/models/correspondence_mode.dart';
import 'package:flutter/material.dart';

import 'incoming_details_view.dart';

class IncomingView extends StatelessWidget {
  const IncomingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...getIncomingMails().map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const IncomingDetailsView()));
                    },
                    leading: Text(e.sender),
                    title: Text(e.subject),
                    subtitle: Text(
                      e.content,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(e.date.toString()),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  List<CorrespondenceModel> getIncomingMails() {
    return List.generate(
        30,
        (index) => CorrespondenceModel(
            date: DateTime.now(),
            sender: 'Dr.Salah (Managing Director)',
            sendingOrganization: 'NMID',
            senderAddress: 'blk 3, uba road, Ilorin',
            subject: 'Request for Loan',
            content:
                'lorem ipsum type of content that can both do anythign and verything at the same thime and then etc',
            receiver: 'Mr. Ugo',
            receiverAddress: 'blk 1, Uba road, ilorin',
            receivingOrganization: 'DFD'));
  }
}
