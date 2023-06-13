import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class Text1TurutanBangku extends StatelessWidget {
  const Text1TurutanBangku({super.key});

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
                DisplayText2("Mengukur daya tahan kardiovaskular."),
                DisplayText("\nJANTINA"),
                DisplayText2("Lelaki dan Perempuan"),
                DisplayText("\nALATAN DAN KEMUDAHAN"),
                DisplayText2("1. Bangku."),
                DisplayText2("2. Jam masa."),
                DisplayText("\nPENGURUSAN UJIAN"),
                DisplayText2("1. Melakukkan naik turun bangku selama 3 minit."),
                DisplayText2(
                    "2. Setelah selesai harus mengambil bacaan nadi pada (Pergelangan Tangan atau Leher) selama 1 minit."),

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
