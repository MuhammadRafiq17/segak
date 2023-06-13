import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class TextTurutanJisim extends StatelessWidget {
  const TextTurutanJisim({super.key});

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
                DisplayText2(
                    "Indeks Jisim Badan adalah antara pengukuran yang digunakan untuk mengukur komposisi badan melibatkan ukuran tinggi dan berat."),
                DisplayText("\nJANTINA"),
                DisplayText2("Lelaki dan Perempuan"),
                DisplayText("\nALATAN DAN KEMUDAHAN"),
                DisplayText2("1. Pengukur tinggi."),
                DisplayText2("2. Penimbang berat."),
                DisplayText2("3. Kalkulator"),
                DisplayText("\nPENGURUSAN UJIAN"),
                DisplayText2(
                    "1. Ukuran Indeks Jisim Badan dilakukan sebelum pelaksanaan ujian-ujian lain."),
                DisplayText2("2. Memakai pakaian yang ringan."),
                DisplayText2("3. Menanggalkan kasut dan stokin."),

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
