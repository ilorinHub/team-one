import 'package:edoc/correspondences/incoming_view.dart';
import 'package:edoc/correspondences/minuted_view.dart';
import 'package:edoc/correspondences/outgoing_view.dart';
import 'package:edoc/memo/create_letter.dart';
import 'package:edoc/memo/create_memo.dart';
import 'package:edoc/ocr.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool ismobile = MediaQuery.of(context).size.width < 500;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: ismobile ? size.width : 800,
            height: ismobile ? size.height * 0.25 : 300,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: ismobile ? size.width * 0.4 : 200,
                            height: 100,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const IncomingView()));
                              },
                              leading: const Icon(Icons.call_received),
                              title: const Text("Incoming"),
                              subtitle: const Text('50'),
                            ),
                          ),
                          SizedBox(
                            width: ismobile ? size.width * 0.4 : 200,
                            height: 100,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OutgoingView()));
                              },
                              leading: const Icon(Icons.outbond),
                              title: const Text("Outgoing"),
                              subtitle: const Text("30"),
                            ),
                          )
                        ],
                      )),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade50),
                    child: SizedBox(
                      width: 200,
                      height: 75,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MinutedView()));
                        },
                        leading: const Icon(Icons.task),
                        title: const Text("Assigned Tasks"),
                        subtitle: const Text('50'),
                      ),
                    ),
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade50))
                ]),
          ),
          SizedBox(
              width: ismobile ? size.width : 500,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CreateMemoScreen()));
                    },
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Create \n New Memo",
                              style: TextStyle(fontSize: ismobile ? 12 : 17)),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CreateLetterScreen()));
                    },
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Create \n New Letter",
                              style: TextStyle(fontSize: ismobile ? 12 : 17)),
                        )),
                  ),
                  SizedBox(
                    width: ismobile ? size.width * 0.4 : 250,
                    height: 75,
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return OCRecognition();
                          }));
                        },
                        leading: const Icon(Icons.scanner),
                        title: Text(
                          "Upload Item",
                          style: TextStyle(fontSize: ismobile ? 12 : 17),
                        )),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
