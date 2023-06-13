import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class Text2TurutanJisim extends StatelessWidget {
  const Text2TurutanJisim({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 360,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 21, 115, 25),
            border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2)),

        child: RichText(
          text: const TextSpan(
            text: 'Prosedur Mengukur Berat Badan',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text:
                    '\n\n1. Pelaksanaan keseluruhan mengukur berat badan adalah seperti gamabr rajah diatas.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text:
                    '\n\n2. Pastikan jarum penunjuk penimbang berada pada angka 0 KG sebelum setiap ukuran diambil.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: '\n\n3. Berdiri tegak di tengah-tengah penimbang.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: '\n\n4. Pandang lurus ke hadapan.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: '\n\n5. Membaca ukuran berat badan yang tertera.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text:
                    '\n\n6. Penimbang digital adalah dibenarkan ddialam ujian ini.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        // child: Text("Prosedur Mengukur Berat Badan", style: heading3),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Row(
    //       children: [
    //         SizedBox(width: small),
    //         Table(
    //           defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    //           columnWidths: {
    //             0: FixedColumnWidth(300),
    //           },
    //           children: [
    //             DisplayText("Prosedur Mengukur Berat Badan"),
    //             DisplayText2(
    //                 "1. Pelaksanaan keseluruhan mengukur berat badan adalah seperti gamabr rajah diatas."),
    //             DisplayText2(
    //                 "2. Pastikan jarum penunjuk penimbang berada pada angka 0 KG sebelum setiap ukuran diambil."),
    //             DisplayText2("3. Berdiri tegak di tengah-tengah penimbang."),
    //             DisplayText2("4. Pandang lurus ke hadapan."),
    //             DisplayText2("5. Membaca ukuran berat badan yang tertera."),
    //             DisplayText2(
    //                 "6. Penimbang digital adalah dibenarkan ddialam ujian ini."),
    //             // DisplayText("Main Contractor", boqMainCon),
    //           ],
    //           // border: TableBorder.all(width: 0.25, color: Colors.green),
    //         )
    //       ],
    //     ),
    //   ],
    // );
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
