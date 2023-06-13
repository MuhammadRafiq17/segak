
import 'package:flutter/material.dart';

import '../../utils/helper.dart';

class ButtonTimerUjian extends StatelessWidget {
  final String text;

  final VoidCallback onClicked;

  const ButtonTimerUjian({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: ThemeHelper().buttonBoxDecoration(context),
        child: ElevatedButton(
          style: ThemeHelper().buttonStyle(),
          onPressed: onClicked,
          child: Padding(
            // padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      );
  // ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  //       ),
  //       child: Text(
  //         text,
  //         style: TextStyle(fontSize: 20),
  //       ),
  //       onPressed: onClicked,
  //     );
}
