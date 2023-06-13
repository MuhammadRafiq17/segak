import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class Text3TurutanBangku extends StatelessWidget {
  const Text3TurutanBangku({super.key});

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
                0: FixedColumnWidth(140),
                1: FixedColumnWidth(140),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      color: Colors.pink,
                      child: const Text(
                        'DENYUTAN NADI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        color: Colors.pink,
                        child: const Text(
                          'SKOR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      child: const Text(
                        '83 dan ke bawah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: const Text(
                          '5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      child: const Text(
                        '84 - 107',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: const Text(
                          '4',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      child: const Text(
                        '108 - 132',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: const Text(
                          '3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      child: const Text(
                        '133 - 156',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: const Text(
                          '2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      child: const Text(
                        '157 dan ke atas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: const Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
              // children: [
              //   DisplayText("TUJUAN"),
              //   DisplayText2("Mengukur daya tahan kardiovaskular."),
              //   DisplayText("\nJANTINA"),
              //   DisplayText2("Lelaki dan Perempuan"),
              //   DisplayText("\nALATAN DAN KEMUDAHAN"),
              //   DisplayText2("1. Bangku."),
              //   DisplayText2("2. Jam masa."),
              //   DisplayText("\nPENGURUSAN UJIAN"),
              //   DisplayText2("1. Melakukkan naik turun bangku selama 3 minit."),
              //   DisplayText2(
              //       "2. Setelah selesai mengambil bacaan nadi pada (Pergelangan Tangan atau Leher) selama 1 minit."),

              //   // DisplayText("Main Contractor", boqMainCon),
              // ],
              border: TableBorder.all(width: 1, color: Colors.green),
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
