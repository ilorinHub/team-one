import 'package:edoc/memo/widgets/dropdown.dart';
import 'package:flutter/material.dart';

class CreateLetterScreen extends StatefulWidget {
  const CreateLetterScreen({super.key});

  @override
  State<CreateLetterScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateLetterScreen> {
  List<String> chooseRankList = [
    'Directors',
    'General Staff',
    'Managers',
    'Secretaries'
  ];

  List<String> chooseDirectorList = [
    'Director ITS',
    'Director Software',
    'Director Procurement',
    'Director Hardware',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text('Speech to Text')),
      appBar: AppBar(
        title: const Text('Create Letter'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              AppDropDownButton(
                hintText: 'Executives',
                items: chooseRankList,
              ),
              const SizedBox(height: 15),
              AppDropDownButton(
                hintText: 'Department',
                items: chooseDirectorList,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Subject'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                minLines: 5,
                maxLines: 10,
                decoration: const InputDecoration(hintText: 'body'),
              )
            ],
          )),
    );
  }
}
