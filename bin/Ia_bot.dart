import 'dart:io';
import 'questions/time_questions.dart';

void main() async {
  String IaBot = 'IaBot:\n';
  var a = true;
  String userInput = '';
  print("IaBot está sendo inicializada, por favor aguarde...\n");

  print("IaBot:\nOlá, o que você quer saber hoje?\n");

  do {
    userInput = stdin.readLineSync().toString();
    print("Lendo a pergunta, aguarde...\n");
    if (userInput.contains("Tchau") ||
        userInput.contains("tchau") ||
        userInput.contains("xau") ||
        userInput.contains("Xau")) {
      a = false;
      print(IaBot + "Espero ter ajudado, até a próxima");
    } else if (TimeQuestions(userInput).isThisTime()) {
      //verfica se é true
      TimeQuestions(userInput).isThisTime();
      //responda a pergunta de que horas são agora
      TimeQuestions(userInput).timeQuestion();
    } else if (false) {
      //outras duvidas
    } else {
      print("Não fui treinado para te passar esta informação.\n Desculpe :(\n");
      print("Te ajudo em algo mais?\n Se não, você pode dizer adeus\n");
    }
  } while (a);
}
