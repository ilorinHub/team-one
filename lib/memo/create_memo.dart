import 'package:edoc/memo/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          label: _speechToText.isNotListening
              ? const Text('Speech to Text')
              : const Icon(Icons.mic)),
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
                decoration: InputDecoration(hintText: _lastWords
                    // _speechToText.isListening
                    //     ? _lastWords
                    //     : _speechEnabled
                    //         ? 'Tap the microphone to start listening...'
                    //         : 'Speech not available',
                    ),
              )
            ],
          )),
    );
  }
}
