class Botclock {
  Future clock(int seconds)  async {

      return Future.delayed(Duration(seconds: seconds));
    }

  Stream IaBotStream(int interval, [int? maxCount]) async* {
    //quero que Stream a cada segundo, entregue um valor sequencial
    int i = 1;

    while (i != maxCount) {
      print("Contador: $i");
      await Future.delayed(Duration(seconds: interval));
      // uso do yield para colher na string
      yield i++;
    }

    IaBotStream(1, 10);
  }
  }

