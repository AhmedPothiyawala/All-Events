import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Custome_Functions/Colors/constants.dart';

class SetingList extends StatelessWidget {
  final title, checkbox;
  const SetingList(this.title, this.checkbox);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: EventColors.kPrimaryLightColor,
        title: Text(
          title,
          style: const TextStyle(
            color: EventColors.kPrimaryDarkColor,
          ),
        ),
        trailing: checkbox == null
            ? const Icon(Icons.navigate_next_outlined)
            : CupertinoSwitch(
                activeColor: EventColors.kPrimary_amount_color,
                value: checkbox,
                onChanged: (value) {
                  //  checkbox = value;
                },
              ));
  }
}
