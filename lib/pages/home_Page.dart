import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:qurandemo/engArabNumConversion.dart';
import 'package:qurandemo/pages/quran_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Center(
          child: Text(
            "القران الكريم",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.separated(
            itemCount: 114,
            separatorBuilder: (context, index) => const Divider(
              height: 0,
            ),
            itemBuilder: (context, index) {
              return QuranListContainer(
                surahName: index + 1,
                index: index + 1,
              );
            },
          ),
        ),
      ),
    );
  }
}

class QuranListContainer extends StatelessWidget {
  const QuranListContainer(
      {super.key, required this.surahName, required this.index});
  final int surahName;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuranPage(
              surahNumber: index,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  NumConversion().replaceArabicNumber(
                      quran.getPageNumber(index, 1).toString()),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  quran.getSurahNameArabic(surahName),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
