import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class OCRecognition extends ConsumerWidget {
  OCRecognition({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Expanded(
                child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/books/ocr.jpeg'))),
            Expanded(
                child: ref.watch(ocrConverte).when(
                    data: (data) {
                      controller.text = data;
                      return TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      );
                    },
                    error: (er, st) => const Text("ERROR"),
                    loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )))
          ],
        ));
  }
}

final ocrConverte = FutureProvider((ref) async {
  return await Future.delayed(
      const Duration(seconds: 3), () => "team soft ai hello world");
  String text =
      await FlutterTesseractOcr.extractText('assets/books/ocr.jpeg', args: {
    "psm": "4",
    "preserve_interword_spaces": "1",
  });
  return text;
});
