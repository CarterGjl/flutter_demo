import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSelect extends StatelessWidget {

  const SingleSelect(this.index, this.widget, this.parent, this.choice);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ChoiceChip(
          label: Text(choice),
          selected: parent.selected == index,
          onSelected: (select){
            parent.onSelectedChange(index);
          },
      ),
    );
  }

  final int index;
  final widget;
  final parent;
  final String choice;



}