import 'package:flutter/material.dart';

class AppDropDownButton extends StatefulWidget {
  const AppDropDownButton({
    Key? key,
    this.items,
    required this.hintText,
    this.multiList,
  }) : super(key: key);

  final List? items;
  final List? multiList;

  final String hintText;

  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  String? selectedValue;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selected = !selected;

        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: (20),
        ),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selected ? Colors.blue : Colors.grey)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              hint: Text(
                widget.hintText,
                style: const TextStyle(color: Colors.grey),
              ),
              items: widget.items != null
                  ? widget.items!
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList()
                  : widget.multiList!
                      .map((item) => DropdownMenuItem<String>(
                            value: item.last,
                            child: Text(
                              item.first,
                              style: const TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
              value: selectedValue,
              onChanged: (str) {
                setState(() {
                  selectedValue = str as String;
                  // viewmodel.setZoneList();
                });
              }),
        ),
      ),
    );
  }
}
