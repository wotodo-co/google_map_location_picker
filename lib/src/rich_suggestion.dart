import 'package:flutter/material.dart';

import 'model/autocomplete_item.dart';

class RichSuggestion extends StatelessWidget {
  final VoidCallback onTap;
  final AutoCompleteItem autoCompleteItem;

  RichSuggestion(this.autoCompleteItem, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: TextSpan(children: getStyledTexts(context)),
                  ),
                )
              ],
            )),
      ),
    );
  }

  List<TextSpan> getStyledTexts(BuildContext context) {
    // final List<TextSpan> result = [];
    return [
      TextSpan(
          text: autoCompleteItem.text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        )
    ];

  }
}
