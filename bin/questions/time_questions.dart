import 'dart:io';


//implementar o tempo em hora dia e ano!

class TimeQuestions{
  String hour = 'Que horas sao?';
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  String question;
  DateTime date = DateTime.now();
  String IaBot = 'IaBOT:\n';
  bool isThisATimeQuestion = false;

  TimeQuestions(this.question);


// Não é necessário
  // String getBotQuestion() {
  //   return isThisATimeQuestion ? timeQuestion() : '';
  // }

  bool isThisTime(){
    //verificar se estamos numa pergunta sobre Tempo
    if (question.contains('horas') ||
        question.contains('Horas') ||
        question.contains('dia') ||
        question.contains('Dia') ||
        question.contains('ano') ||
        question.contains('Ano')) {
      isThisATimeQuestion = true;
    }
    return isThisATimeQuestion;
  }


  timeQuestion() {

    if (question == hour) {

      String _botAnswer = IaBot + ' Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(_botAnswer);
    } else if (question == day) {

      String _botAnswer = IaBot + ' Opa! hoje é dia : ${date.day}';
      print(_botAnswer);
    } else if (question == year) {

      String _botAnswer = IaBot + ' Opa! estamos em : ${date.year}';
      print(_botAnswer);
    } else {
      unsure();
    }
  }

  //para entrada diferente da definida mas que parece padrao
  unsure() {
    if (question.contains('horas') || question.contains('Horas')) {

      String _botQuestion =
          IaBot + ' Não entendi, você quer saber das horas?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim') || answer.contains('isso')  || answer.contains('Isso')) {

        String _botAnswer = IaBot + ' Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(_botAnswer);
      } else {

        String _botAnswer = IaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('dia') || question.contains('Dia')) {

      String _botQuestion =
          IaBot + ' Não entendi, você quer saber que dia é hoje?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim') || answer.contains('isso')  || answer.contains('Isso')) {

        String _botAnswer = IaBot + ' Beleza, hoje é dia: ${date.day}';
        print(_botAnswer);
      } else {

        String _botAnswer = IaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('ano') || question.contains('Ano')) {

      String _botQuestion =
          IaBot + ' Não entendi, você quer saber em que ano estamos?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim') || answer.contains('isso')  || answer.contains('Isso')) {

        String _botAnswer = IaBot +
            ' Beleza, estamos no ano em que vou ganhar na mega e deixar de ser pobre... \n '
                'Brincadeirinha! estamos em : ${date.year}';
        print(_botAnswer);
      } else {

        String _botAnswer = IaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    }
  }
}
