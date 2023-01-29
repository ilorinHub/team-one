import 'package:edoc/memo/widgets/dropdown.dart';
import 'package:flutter/material.dart';

class CreateMemoScreen extends StatefulWidget {
  const CreateMemoScreen({super.key});

  @override
  State<CreateMemoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateMemoScreen> {
  List<String> choooseCompany = [
    'NITDA',
    'FIRS',
    'Ilorin Innovation Hub',
    'Kwara state Government'
  ];

  List<String> chooseDepartment = [
    'E-Government',
    'Software',
    'Procurement',
    'Hardware',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text('Speech to Text')),
      appBar: AppBar(
        title: const Text('Create Memo'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              AppDropDownButton(
                hintText: 'Company Name',
                items: choooseCompany,
              ),
              const SizedBox(height: 15),
              AppDropDownButton(
                hintText: 'Department',
                items: chooseDepartment,
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
