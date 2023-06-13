import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class Text1TurutanMelunjur extends StatelessWidget {
  const Text1TurutanMelunjur({super.key});

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
                    "Mengukur fleksibiliti bahagian bawah belakang badan (lower back) dan otot hamstring."),
                DisplayText("\nJANTINA"),
                DisplayText2("- Lelaki dan Perempuan"),
                DisplayText("\nALATAN DAN KEMUDAHAN"),
                DisplayText2("1. Alat jankauan melunjur."),
                DisplayText2("2. Pembaris."),
                DisplayText2("3. Meja kecil jika tiada alat."),
                DisplayText("\nPENGURUSAN UJIAN"),
                DisplayText2(
                    "1. Aktiviti dilakukkan dengan duduk melunjur diatas bangku lunjuran. Jika tiada peralatan, boleh menggunakan kaedah lunjuran diatas meja kecil."),
                DisplayText2("2. Ukur jarak lunjuran dan catatkan."),

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
