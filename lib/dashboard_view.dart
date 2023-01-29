import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool ismobile = MediaQuery.of(context).size.width < 500;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: ismobile ? 100 : 500,
            height: ismobile ? 50 : 200,
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
                            width: 200,
                            height: 75,
                            child: ListTile(
                              onTap: () {},
                              leading: const Icon(Icons.call_received),
                              title: const Text("Incoming"),
                              subtitle: const Text('50'),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 75,
                            child: ListTile(
                              onTap: () {},
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
                        onTap: () {},
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
              width: 500,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Create \n New Memo",
                              style: TextStyle(fontSize: 17)),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Create \n New Letter",
                              style: TextStyle(fontSize: 17)),
                        )),
                  ),
                  SizedBox(
                    width: 250,
                    height: 75,
                    child: ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.scanner),
                        title: const Text("Upload Item")),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
