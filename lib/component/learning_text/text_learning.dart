import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class TextLearning extends StatelessWidget {
  const TextLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: small),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FixedColumnWidth(300),
              },
              children: [
                DisplayText("Sila ikut pada setiap turutan yang betul"),
                DisplayText2(
                    "- Perkataan SEGAK telah diputuskan oleh Menteri Pendidikan Malaysia pada tahun 2006."),
              ],
            )
          ],
        ),
      ],
    );
  }

  DisplayText(String info) {
    return TableRow(children: [
      Text(
        info,
        textScaleFactor: 1.2,
        textAlign: TextAlign.start,
        style: heading4,
      ),
    ]);
  }

  DisplayText2(String info) {
    return TableRow(children: [
      Text(
        info,
        textScaleFactor: 1.2,
        textAlign: TextAlign.start,
        style: p1,
      ),
    ]);
  }
}
