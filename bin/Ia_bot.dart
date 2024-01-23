import 'dart:io';
import 'Time/waiting_time.dart';
import 'questions/time_questions.dart';



void main() async {
  String IaBot = 'IaBot:\n';
  var a = true;
  String userInput = '';

 var myStream = Botclock().IaBotStream(1,10);
 var subscriber = myStream.listen((event) {
   print("               IaBot está ativado por $event segundos");
 },onDone: (){
   print("IaBot está finalizando seu trabalho, faça a ultima pergunta!");
   a = false;
 });

  print("IaBot está sendo inicializada, por favor aguarde...\n");

  await Botclock().clock(2);

  print("IaBot:\nOlá, o que você quer saber hoje?\n");

  do {
    userInput = stdin.readLineSync().toString();
    print("Lendo a pergunta, aguarde...\n");
    await Botclock().clock(2);
    if (userInput.contains("Tchau") ||
        userInput.contains("tchau") ||
        userInput.contains("xau") ||
        userInput.contains("Xau")) {
      a = false;
      print(IaBot + "Espero ter ajudado, até a próxima");
    } else if (TimeQuestions(userInput).isThisTime()) {
      await Botclock().clock(2);
      //verfica se é true
      TimeQuestions(userInput).isThisTime();
      //responda a pergunta de que horas são agora
      TimeQuestions(userInput).timeQuestion();
    } else if (false) {
      //outras duvidas
    } else {
      await Botclock().clock(2);
      print("Não fui treinado para te passar esta informação.\n Desculpe :(\n");

      print("Te ajudo em algo mais?\n Se não, você pode dizer adeus\n");
    }
  } while (a);
}
