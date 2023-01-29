import 'package:edoc/correspondences/mobile_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:text_to_speech/text_to_speech.dart';

class MinutedView1 extends StatefulWidget {
  const MinutedView1({Key? key}) : super(key: key);

  @override
  State<MinutedView1> createState() => _MinutedView1State();
}

class _MinutedView1State extends State<MinutedView1> {
  PdfViewerController? _pdfViewerController;

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  OverlayEntry? _overlayEntry;
  late PdfTextSearchResult _searchResult;
  ChatOptions groupValue = ChatOptions.neutral;
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    super.initState();
  }

  TextToSpeech tts = TextToSpeech();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return isMobile
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pdfViewerController!.previousPage();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pdfViewerController!.nextPage();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pdfViewerKey.currentState?.openBookmarkView();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _searchResult = _pdfViewerController!.searchText(
                      'the',
                    );
                    if (kIsWeb) {
                      setState(() {});
                    } else {
                      _searchResult.addListener(() {
                        if (_searchResult.hasResult) {
                          setState(() {});
                        }
                      });
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.record_voice_over,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    var data = await Clipboard.getData('text/plain');
                    data != null ? tts.speak(data.text!) : null;
                  },
                ),
                Visibility(
                  visible: _searchResult.hasResult,
                  child: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _searchResult.clear();
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: _searchResult.hasResult,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _searchResult.previousInstance();
                    },
                  ),
                ),
                Visibility(
                  visible: _searchResult.hasResult,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _searchResult.nextInstance();
                    },
                  ),
                ),
              ],
            ),
            drawer: const MobileDrawer(),
            body: Expanded(
                child: Scaffold(
              body: SfPdfViewer.asset(
                'assets/books/hackathon.pdf',
                canShowPasswordDialog: true,
                controller: _pdfViewerController,
                key: _pdfViewerKey,
                currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
                otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
                onTextSelectionChanged:
                    (PdfTextSelectionChangedDetails details) {
                  if (details.selectedText == null && _overlayEntry != null) {
                    _overlayEntry?.remove();
                    _overlayEntry = null;
                  } else if (details.selectedText != null &&
                      _overlayEntry == null) {
                    _showContextMenu(context, details);
                  }
                },
              ),
            )),
          )
        : Row(
            children: [
              Expanded(
                  child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _pdfViewerController!.previousPage();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _pdfViewerController!.nextPage();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _pdfViewerKey.currentState?.openBookmarkView();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _searchResult = _pdfViewerController!.searchText(
                          'the',
                        );
                        if (kIsWeb) {
                          setState(() {});
                        } else {
                          _searchResult.addListener(() {
                            if (_searchResult.hasResult) {
                              setState(() {});
                            }
                          });
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.record_voice_over,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        var data = await Clipboard.getData('text/plain');
                        data != null ? tts.speak(data.text!) : null;
                      },
                    ),
                    Visibility(
                      visible: _searchResult.hasResult,
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _searchResult.clear();
                          });
                        },
                      ),
                    ),
                    Visibility(
                      visible: _searchResult.hasResult,
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _searchResult.previousInstance();
                        },
                      ),
                    ),
                    Visibility(
                      visible: _searchResult.hasResult,
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _searchResult.nextInstance();
                        },
                      ),
                    ),
                  ],
                ),
                body: SfPdfViewer.asset(
                  'assets/books/hackathon.pdf',
                  canShowPasswordDialog: true,
                  controller: _pdfViewerController,
                  key: _pdfViewerKey,
                  currentSearchTextHighlightColor:
                      Colors.yellow.withOpacity(0.6),
                  otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
                  onTextSelectionChanged:
                      (PdfTextSelectionChangedDetails details) {
                    if (details.selectedText == null && _overlayEntry != null) {
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    } else if (details.selectedText != null &&
                        _overlayEntry == null) {
                      _showContextMenu(context, details);
                    }
                  },
                ),
              )),
              Expanded(
                  child: Scaffold(
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
                            const Text("MINUTES",
                                style: TextStyle(fontSize: 20)),
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
                                      value: "Mrs. Ake",
                                      child: Text("Mrs. Ake")),
                                  DropdownMenuItem(
                                      value: "Engr sabo",
                                      child: Text("Engr Sabo")),
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
                                        onPressed: () {},
                                        icon: const Icon(Icons.send))))
                          ]),
                    )),
              )),
            ],
          );
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion?.bottomLeft.dx,
        child: ElevatedButton(
          child: const Text('Copy', style: TextStyle(fontSize: 17)),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: details.selectedText));
            _pdfViewerController!.clearSelection();
          },
        ),
      ),
    );
    overlayState.insert(_overlayEntry!);
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Comment $index',
      expandedValue: 'Dr. Salihu',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: const Text('Please review and advise immediately'),
              trailing: const Icon(Icons.attachment),
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                          width: 250,
                          height: 250,
                          child: Image.network(
                              'https://images.unsplash.com/photo-1460472178825-e5240623afd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'));
                    });
                // setState(() {
                //   _data.removeWhere((Item currentItem) => item == currentItem);
                // });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

enum ChatOptions { positive, neutral, negative }
