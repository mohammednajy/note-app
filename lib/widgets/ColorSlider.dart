import 'package:flutter/material.dart';
import 'package:note_app/utils/constant.dart';

class MyColorPicker extends StatefulWidget {
  // This function sends the selected color to outside
  final Function onSelectColor;

  // List of pickable colors
  final List<Color> availableColors;

  // The default picked color
  final Color initialColor;

  // Determnie shapes of color cells
  final bool circleItem;

  // final int selectedColor;

  MyColorPicker(
      {Key? key,
      required this.onSelectColor,
      required this.availableColors,
      required this.initialColor,
      // required this.selectedColor,
      this.circleItem = true})
      : super(key: key);

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: ListView.builder(
        itemCount: bottomSheetColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemColor, index);
              setState(() {
                _pickedColor = itemColor;
              });
            },
            child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: itemColor,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: itemColor == _pickedColor
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox()),
          );
        },
      ),
    );
  }
}
