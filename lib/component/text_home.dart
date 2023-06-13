import 'package:flutter/material.dart';
import 'package:segak/utils/styles.dart';

class TextHome extends StatelessWidget {
  const TextHome({super.key});

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
                DisplayText(
                    "STANDARD KECERGASAN FIZIKAL KEBANGSAAN UNTUK MURID SEKOLAH MALAYSIA (SEGAK)"),
                DisplayText2(
                    "- Perkataan SEGAK telah diputuskan oleh Menteri Pendidikan Malaysia pada tahun 2006."),
                DisplayText2(
                    "- SEGAK juga membawa maksud murid-murid sekolah mempunyai imej dan perawakan yang SEGAK serta kelihatan sihat dan cergas."),
                DisplayText2(
                    "- Perkataan SEGAK juga sesuai bagi penampilan murid lelaki dan perempuan."),
                DisplayText2(
                    "- Komponen kecergasan fizikal yang diukur dalam SEGAK terkandung dalam kurikulum Pendidikan Jasmani sekolah rendah dan menengah."),
                DisplayText("\nMATLAMAT SEGAK"),
                DisplayText2(
                    "Menjadikan murid sentiasa peka, berpengetahuan dan mengamalkan aktiviti kecergasan untuk meningkat dan mengekalkan tahap kecergasan fizikal berdasarkan kesihatan yang optimum."),
                DisplayText("\nOBJEKTIF SEGAKK"),
                DisplayText2(
                    "- Murid dapat mengukur dan merekodkan tahap kecergasan fizikal kendiri."),
                DisplayText2(
                    "- Murid dapat menganalisis dan mentafsir kecergasan fizikal kendiri."),
                DisplayText2(
                    "- Murid dapat mengetahui tahap kecergasan fizikal kendiri."),
                DisplayText2(
                    "- Murid dapat merancang dan melakukan tindakan susulan bagi meningkatkan tahap kecergasan fizikal."),
                DisplayText2(
                    "- Murid dapat Mengamalkan gaya hidup aktif dan sihat untuk mencapai tahap kecergasan fizikal berdasarkan kesihatan yang optimum."),
                DisplayText("\nPELAKSANAAN UJIAN SEGAK"),
                DisplayText2("- Pengiraan Indeks Jisim Badan."),
                DisplayText2("- Ujian Naik Turun Bangku selama 3 minit."),
                DisplayText2("- Ujian Tekan Tubi atau Tekan Tubi Ubah Suai."),
                DisplayText2("- Ujian Ringkuk Tubi Separa."),
                DisplayText2("- Ujian Jangkauan Melunjur."),

                // DisplayText("Main Contractor", boqMainCon),
              ],
              // border: TableBorder.all(width: 0.25, color: Colors.black),
            )

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //         'STANDARD KECERGASAN FIZIKAL \nKEBANGSAAN UNTUK MURID SEKOLAH \nMALAYSIA (SEGAK)',
            //         style: heading3),
            //     Text(
            //         '\n- Perkataan SEGAK telah diputuskan oleh \nMenteri Pendidikan Malaysia \npada tahun 2006.',
            //         style: p1),
            //     Text(
            //         '- SEGAK juga membawa maksud murid-murid \nsekolah mempunyai imej dan perawakan yang \nSEGAK serta kelihatan sihat dan cergas.',
            //         style: p1),
            //     Text(
            //         '- Perkataan SEGAK juga sesuai bagi \npenampilan murid lelaki dan perempuan.',
            //         style: p1),
            //     Text(
            //         '- Komponen kecergasan fizikal yang diukur \ndalam SEGAK terkandung dalam kurikulum \nPendidikan Jasmani sekolah rendah dan \nmenengah.',
            //         style: p1),
            //     Text(
            //         '\n-------------------------------------------------------------------------',
            //         style: p1),
            //     Text('\nMATLAMAT SEGAK', style: heading3),
            //     Text(
            //         '\nMenjadikan murid sentiasa peka, \nberpengetahuan dan mengamalkan aktiviti \nkecergasan untuk meningkat dan \nmengekalkan tahap kecergasan fizikal \nberdasarkan kesihatan yang optimum.',
            //         style: p1),
            //     Text(
            //         '\n-------------------------------------------------------------------------',
            //         style: p1),
            //     Text('\nOBJEKTIF SEGAKK', style: heading3),
            //     Text(
            //         '\n- Murid dapat mengukur dan merekodkan \ntahap kecergasan fizikal kendiri.',
            //         style: p1),
            //     Text(
            //         '- Murid dapat menganalisis dan mentafsir \nkecergasan fizikal kendiri.',
            //         style: p1),
            //     Text(
            //         '- Murid dapat mengetahui tahap kecergasan \nfizikal kendiri.',
            //         style: p1),
            //     Text(
            //         '- Murid dapat merancang dan melakukan \ntindakan susulan bagi meningkatkan tahap \nkecergasan fizikal.',
            //         style: p1),
            //     Text(
            //         '- Murid dapat Mengamalkan gaya hidup aktif \ndan sihat untuk mencapai tahap kecergasan \nfizikal berdasarkan kesihatan yang optimum.',
            //         style: p1),
            //     Text(
            //         '\n-------------------------------------------------------------------------',
            //         style: p1),
            //     Text('\nPELAKSANAAN UJIAN SEGAK', style: heading3),
            //     Text('\n- Pengiraan Indeks Jisim Badan.', style: p1),
            //     Text('- Ujian Naik Turun Bangku selama 3 minit.', style: p1),
            //     Text('- Ujian Tekan Tubi atau Tekan Tubi Ubah Suai.',
            //         style: p1),
            //     Text('- Ujian Ringkuk Tubi Separa.', style: p1),
            //     Text('- Ujian Jangkauan Melunjur.', style: p1),
            //   ],
            // ),
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
