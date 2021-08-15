import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/bank_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:universal_html/html.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class VarChangeController extends GetxController {
  static VarChangeController to = Get.find();

  RxList<String> list = RxList<String>();

  /// GetX controllers
  final BankController _bankController = BankController.to;

  final results = [''].obs;
  final text = '''can use it for many word games:
  to create or to solve {{ssss}}, {{rowords}} rosswords with arrows),
  word puzzles, to play Scrabble, Words With Friends, 
  hangman, the longest word, and for creative writing: rhymes search for poetry, 
  and words that satisfy constraints from the Ouvroir de {{ttrature_wat}} ielle
  (OuLiPo: workshop of potential litterature) such as lipograms, pangrams, anagrams,
  univocalics, uniconsonantics etc.'''
      .obs;

  void abc({required String blockId}) {
    _bankController.getBlock(blockId: blockId);

    setText(_bankController.currentBlock.value == null
        ? 'Please refresh!'
        : _bankController.currentBlock.value!.body);
  }

  void setText(String text) {
    this.text.value = text;
  }

  List<String> findVars(String block) {
    RegExp exp = RegExp(r"{{\w+}}");
    List<String> listOfVars = [];
    Iterable<Match> matches = exp.allMatches(block);
    for (Match m in matches) {
      String match = m[0]!;
      listOfVars.add(match);
    }
    return listOfVars;
  }

  void replaceVars(List<String> replacements) {
    List<String> vars = findVars(text.value);

    for (String word in vars) {
      int index = vars.indexOf(word);

      if (replacements.asMap().containsKey(index) && replacements[0] != '') {
        RegExp exp = RegExp(word);
        text.value = text.value.replaceFirst(exp, replacements[index]);
      }
    }
    text.value = text.value;

    addToList();
  }

  void addToList() {
    list.add(text.value);

    print(list.length);
  }

  createPDF() async {
    // PdfDocument doc = PdfDocument();

    final pdf = pw.Document();
    final font = await rootBundle.load("OpenSans-Regular.ttf");
    final ttf = pw.Font.ttf(font);
    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) => <pw.Widget>[
          pw.Wrap(
            children: List<pw.Widget>.generate(list.length, (int index) {
              return pw.Container(
                child: pw.Column(
                  children: <pw.Widget>[
                    pw.Text(this.list[index],
                        style: pw.TextStyle(font: ttf, fontSize: 12)),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
    List<int> bytes = await pdf.save();
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "example.pdf")
      ..click();
  }
}
