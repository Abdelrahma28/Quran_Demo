// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quran/quran.dart' as quran;
// import 'package:quran/quran.dart';
//
// class QuranPage extends StatefulWidget {
//   const QuranPage(
//       {super.key,
//       this.selectedPage = 1,
//       required this.surahName,
//       required this.surahNumber});
//   final int selectedPage;
//   final String surahName;
//   final int surahNumber;
//
//   @override
//   State<QuranPage> createState() => _QuranPageState();
// }
//
// class _QuranPageState extends State<QuranPage> {
//   @override
//   Widget build(BuildContext context) {
//     final counterTextStyle = GoogleFonts.rubik(
//         fontStyle: FontStyle.normal,
//         fontSize: 22,
//         textStyle: Theme.of(context).textTheme.bodyMedium);
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             widget.surahName,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: PageView.builder(
//           controller: PageController(
//               initialPage: widget.selectedPage,
//               keepPage: true,
//               viewportFraction: 1),
//           itemCount: 604,
//           reverse: true,
//           itemBuilder: (context, index) {
//             print("index number = $index");
//             print("surah number = ${quran.getSurahPages(widget.surahNumber)}");
//             print("page number = ${widget.surahNumber}");
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: Center(
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.justify,
//                         quran
//                             .getVersesTextByPage(index,
//                                 verseEndSymbol: true, customSurahSeperator: "")
//                             .toString()
//                             .replaceAll('[', '')
//                             .replaceAll(']', '')
//                             .replaceAll(',', ''),
//                         style: counterTextStyle,
//                       ),
//                       Text(
//                         index.toString(),
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.justify,
//                         style: counterTextStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

class QuranPage extends StatelessWidget {
  QuranPage({super.key, required this.surahNumber});
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    final counterTextStyle = GoogleFonts.rubik(
        fontStyle: FontStyle.normal,
        fontSize: 22,
        textStyle: Theme.of(context).textTheme.bodyMedium);
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(
              initialPage: quran.getSurahPages(surahNumber).first - 1,
              keepPage: true,
              viewportFraction: 1),
          itemCount: 604,
          reverse: true,
          itemBuilder: (context, index) {
            return Image.asset('assets/images/${index + 1}.png');
          },
        ),
      ),
    );
  }
}
