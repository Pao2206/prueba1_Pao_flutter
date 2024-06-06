import 'package:flutter/material.dart';
import 'package:prueba1_pao/main.dart';

void main() {
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 02'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/img01.jpg'),
        fit: BoxFit.fill,
        )
    ),
    child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Campo1(),
          BotonCalcular(context),
          BotonRegresar(context),
        ],
      )
    ),
  );
}

Widget BotonRegresar( context ){
  return Container(
    alignment: Alignment.bottomRight,
    child: ( 
      ElevatedButton(onPressed: () {
        irPrincipal(context );
      }, child: Text("REGRESAR"),)
    ),
  );
}

void irPrincipal( context ){
  Navigator.pushReplacement(
    context, MaterialPageRoute(
      builder: (context)=> const Prueba1()));
}

final  TextEditingController _velocidad = TextEditingController();

Widget Campo1() {
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      TextField(
        controller: _velocidad,
        decoration:
            InputDecoration(hintText: "Ingrese la velocidad"),
            keyboardType: TextInputType.number,)
            ),
  );
}

Widget BotonCalcular( context ){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      FilledButton(onPressed: (){
        alertRespuesta(context);
      }, child: Text("Calcular"),)
    ),
  );
}

double calculo (  ){
  double velocidad = double.tryParse(_velocidad.text) ?? 0.00;
  double distancia = velocidad * 25;
 
  return distancia;
}


void alertRespuesta(context){
  showDialog(context: context, builder: (context){
    return  AlertDialog(
      title: Text("Respuesta"),
      content: Text("La distancia recorrida es ${calculo()}"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("CERRAR"))
      ],
    );
  }
  );
}