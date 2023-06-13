import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class Text1TurutanRingkuk extends StatelessWidget {
  const Text1TurutanRingkuk({super.key});

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
                DisplayText("TUJUAN"),
                DisplayText2("Mengukur daya tahan dan kekuatan otot abdomen."),
                DisplayText("\nJANTINA"),
                DisplayText2("- Lelaki dan Perempuan"),
                DisplayText("\nALATAN DAN KEMUDAHAN"),
                DisplayText2("1. Alas."),
                DisplayText2("2. Jam masa."),
                DisplayText("\nPENGURUSAN UJIAN"),
                DisplayText2(
                    "1. Melakukkan aktiviti ringkuk tubi separa dengan kedudukan berbaring dan kaki mesti dibengkokkan dan tangan diatas permukaan alas."),
                DisplayText2(
                    "2. Tangan hendaklah digerakkan diatas permukaan tilam sehinggan menyentuh kaki."),
                DisplayText2("3. Aktiviti dilakukkan selama 1 minit."),

                // DisplayText("Main Contractor", boqMainCon),
              ],
              // border: TableBorder.all(width: 0.25, color: Colors.black),
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
        style: heading3,
        // TextStyle(
        //   fontWeight: FontWeight.bold,
        // ),
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
        // TextStyle(
        //   fontWeight: FontWeight.bold,
        // ),
      ),
    ]);
  }
}
