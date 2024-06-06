import 'package:flutter/material.dart';
import 'package:prueba1_pao/screens/Ejercicio01.dart';
import 'package:prueba1_pao/screens/Ejercicio02.dart';

void main (){
  return runApp(Prueba1());
}

class Prueba1 extends StatelessWidget {
  const Prueba1({super.key});

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
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Cuerpo(context),
      Ejercicio01()
      ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba Parcial 1'),
      ),
      body: screens[indice],
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.all_out), label: "Prueba"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "Ejercicio 01"),
        ],
      ),
      //////////////////////////////
    );
  }
}

Widget Cuerpo(context){
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://img.freepik.com/free-photo/cute-pet-collage-isolated_23-2150007407.jpg?t=st=1717680938~exp=1717684538~hmac=0029c7e837f7abe61ba34c8432bb4526ee930fa33841b10a466a3b57c258a6c2&w=740"),
        fit: BoxFit.fill,
        )
    ),
    child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Paola Tamayo"),
          Text("Pao2206"),
          Boton1(context),
        ],
      )
    ),
  );
}

Widget Boton1(context){
     return Container(
       padding: const EdgeInsets.all(10.0),
       child: ( 
           ElevatedButton( onPressed: () {
        mostrarAlerta01(context);
           }, child: const Text("¡Alerta!") )
          ),
     );
}

void mostrarAlerta01( BuildContext context ){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Mensaje Importante"),
      content: Text("Desea ir al ejercicio 02?"),
      actions: [
        TextButton(onPressed: (){
          irEjercicio2(context);
        }, child: Text("Si"),
        ),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("No"),
        ) 
      ],
    );
  } );
}

void irEjercicio2( context ){
  Navigator.pushReplacement(
    context, MaterialPageRoute(
      builder: (context)=> Ejercicio02() ));
}
