import 'package:edoc/correspondences/minuted_view_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  ChatOptions groupValue = ChatOptions.neutral;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("MINUTES", style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyStatefulWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                      hint: const Text("Select Reciever"),
                      items: const [
                        DropdownMenuItem(
                          value: 'Engr gambo',
                          child: Text("Engr Gambo"),
                        ),
                        DropdownMenuItem(
                            value: "Mrs. Ake", child: Text("Mrs. Ake")),
                        DropdownMenuItem(
                            value: "Engr sabo", child: Text("Engr Sabo")),
                      ],
                      onChanged: (selected) {}),
                  RadioGroup<ChatOptions>.builder(
                    direction: Axis.horizontal,
                    groupValue: groupValue,
                    onChanged: (value) => setState(() {
                      groupValue = value!;
                    }),
                    items: ChatOptions.values,
                    itemBuilder: (item) => RadioButtonBuilder(
                      describeEnum(item),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          hintText: groupValue == ChatOptions.negative
                              ? 'Message not acknowledged'
                              : groupValue == ChatOptions.negative
                                  ? 'seen'
                                  : "acknowledged",
                          suffix: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.send))))
                ]),
          )),
    );
  }
}
