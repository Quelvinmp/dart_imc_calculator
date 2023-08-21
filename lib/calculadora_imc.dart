import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:calculadora_imc/classes/pessoa.dart';

void consoleCalculator() {
  print('Bem-Vindo a Calculadora IMC em DART!');

  print('Por favor, digite seu nome:');
  var line = stdin.readLineSync(encoding: utf8);
  var nome = line ?? '';

  print('Qual o seu peso?');
  line = stdin.readLineSync(encoding: utf8);
  var peso = double.parse(line ?? '0');

  print('Por último, qual sua altura?');
  line = stdin.readLineSync(encoding: utf8);
  var altura = double.parse(line ?? '0');

  var pessoa = Pessoa(nome, peso, altura);

  String imc = imcCalculator(pessoa.getPeso(), pessoa.getAltura());

  print('Agradecemos, ${pessoa.getNome()}, por utilizar nossa ferramenta!');
  print('Seu IMC é: $imc');
}

String imcCalculator(double peso, double altura) {

  double formula = peso / pow(altura, 2);
  String response;

    if(formula < 16) {
    response = 'Magreza Grave';
    } else if(formula >= 16 && formula <= 17) {
    response = 'Magreza Moderada';
    } else if(formula >= 17 && formula <= 18.5) {
    response = 'Magreza Leve';
    } else if(formula > 18.5 && formula <= 25) {
    response = 'Saudável';
    } else if(formula >= 25 && formula <= 30) {
    response = 'Sobrepeso';
    } else if(formula >= 30 && formula <= 35) {
    response = 'Obesidade Grau I';
    } else if(formula >= 35 && formula <= 40) {
    response = 'Obesidade Grau II (Severa)';
    } else {
    response = 'Obesidade Grau III (Mórbida)';
    }

  return '$formula -> $response';
}
