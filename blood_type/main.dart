import 'package:blood_types/individual.dart';
import 'package:blood_types/utils.dart';

void main() {
  List<String> genotypes = [
    'A',
    'B',
    'i',
    'AC',
    '',
    'AA',
    'Ai',
    'BB',
    'Bi',
  ];
  List<Individual> indivs = [];
  const tab2cols = [5, 50];
  const tab3cols = [5, 12, 40];
  const tab6cols = [5, 12, 10, 10, 15, 15];

  tabPrint('T#\tMessage', tab2cols);
  for (var genotype in genotypes) {
    try {
      var indiv = Individual(genotype);
      indivs.add(indiv);
      testPrint('$indiv', tab2cols);
    } catch (_) {
      testPrint('Bad individual genotype: $genotype', tab2cols);
    }
  }

  indivs.add(Individual('AB', 'Fulano'));
  indivs.add(Individual('ii', 'Cicrano'));
  for (var i = indivs.length - 2; i < indivs.length; i++) {
    testPrint('${indivs[i]}', tab2cols);
  }

  print('');
  tabPrint(
      'T#\tINDIVIDUAL\tGENOTYPE\tALLELES\tAGGLUTINOGENS\tAGLUTININS', tab6cols);
  for (var indiv in indivs) {
    testPrint(
      '$indiv\t${indiv.genotype}\t${indiv.genotype.alleles}\t'
      '${indiv.genotype.agglutinogens}\t${indiv.genotype.agglutinins}',
      tab6cols,
    );
  }

  print('');
  tabPrint('T#\tCROSSOVER\tRESULT', tab3cols);
  for (var indiv1 in indivs) {
    for (var indiv2 in indivs) {
      var offsprings = indiv1.genotype.offsprings(indiv2.genotype);
      testPrint(
        '${indiv1.genotype} x ${indiv2.genotype}\t$offsprings',
        tab3cols,
      );
    }
  }

  print('');
  tabPrint('T#\tDONATION\tRESULT', tab3cols);
  for (var indiv1 in indivs) {
    for (var indiv2 in indivs) {
      testPrint(
        '${indiv1.genotype} -> ${indiv2.genotype}\t'
        '${indiv1.genotype.compatible(indiv2.genotype)}',
        tab3cols,
      );
    }
  }
}

int _testCounter = 0;

void testPrint(
  String text, [
  List<int>? tabs,
]) {
  _testCounter++;

  var test = _testCounter.toString().padLeft(2, '0');
  tabPrint('T$test\t$text', tabs);
}
