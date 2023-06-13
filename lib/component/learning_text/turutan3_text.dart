import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class Text1TurutanTekan extends StatelessWidget {
  const Text1TurutanTekan({super.key});

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
                DisplayText2("Mengukur daya tahan otot tangan dan bahu."),
                DisplayText("\nJANTINA"),
                DisplayText2("- Lelaki (Tekan Tubi)"),
                DisplayText2("- Perempuan (Tekan Tubi Ubah Suai)"),
                DisplayText("\nALATAN DAN KEMUDAHAN"),
                DisplayText2("1. Alas."),
                DisplayText2("2. Jam masa."),
                DisplayText("\nPENGURUSAN UJIAN"),
                DisplayText2(
                    "1. Melakukkan aktiviti tekan tubi dengan kedudukan badan tegak selari dengan bahu."),
                DisplayText2(
                    "2. Dada hendaklah menyentuh alas yang diletakkan seperti didalam gambar."),
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
