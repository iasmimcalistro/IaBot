import 'dart:math';

void main() {

//   Future MyFuture = Future((){
//   print("Teste");
//   return 30;
// //só funciona depois que o future é finalizado
//   }).then((value) => print('O valor é $value'));


//funcao assincrona e espera
  Future <int> myFutureFunction()async{
    print("Eu tenho uma função no futuro");
  await Future.delayed(Duration(seconds: 5));
  throw Exception();


  }
  // myFutureFunction()
  //     .then((value) => print("A função futura tem valor $value"))
  //     .onError((error, stackTrace) => print("Um erro aconteceu"))
  //     .whenComplete(() => print("Meu future acabou"));

  //criando uma nova função para tratar erros de forma síncrona
  Future<int> myFutureErrorFunc(int a, int b) async{
    try{
      if(a>b){
        throw Exception();
      }
      print("Eu tenho uma função no futuro");
      await Future.delayed(Duration(seconds: 5));
      return 15;
    }catch(e){
      print('Existe um erro: $e' );
      return 40;
    }finally{
      print('Acabou a tratativa' );
    }


  }

  myFutureErrorFunc(2,1).then((value) => print("o valor é: $value"));
  print("Acabou");
}