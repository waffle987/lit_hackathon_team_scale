import 'package:get/get.dart';

class VarController extends GetxController {
  List<String> findVars(String block) {
    RegExp exp = RegExp(r"{{([(a-zA-Z)])\w+}}");
    List<String> listOfVars = [];
    Iterable<Match> matches = exp.allMatches(block);
    for (Match m in matches) {
      String match = m[0]!;
      listOfVars.add(match);
    }
    return listOfVars;
  }

  String replaceVars(List<String> replacements, String block) {
    for (String word in findVars(block)) {
      int index = findVars(block).indexOf(word);
      RegExp exp = RegExp(word, caseSensitive: false);
      block = block.replaceFirst(exp, replacements[index]);
    }
    return block;
  }
}
