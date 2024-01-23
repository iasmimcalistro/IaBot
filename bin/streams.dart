import 'dart:async';

void main() async {
  // intervalo pra definir o tempo de enviar informaçoes e qnt max de tempo aberto
  Stream myStream(int interval, [int? maxCount]) async* {
    //quero que Stream a cada segundo, entregue um valor sequencial
    int i = 1;

    while (i != maxCount) {
      print("Contador: $i");
      await Future.delayed(Duration(seconds: interval));
      // uso do yield para colher na string
      yield i++;
    }

    myStream(1, 10);
  }
  var IaStream = myStream(1).asBroadcastStream(); //broadcast assistido por varios inscritos
  StreamSubscription mySubscriber = myStream(1).listen((event) {
    try {
      if (event.isEven) {
        print("Este número é par");
      }
    } catch (e) {
      print("Deu erro no app");
    }
  });
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause();
  print("Stream pausada");
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume();
  print("Stream retomada");
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel();
  print("Stream cancelada");

  IaStream.map((event) => 'Segundo inscrito está assistindo >: $event').listen(print);
  
  print("Main terminou");
}
