import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

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
        title: const Text('Ejercicio 01'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: NetworkImage(
          "https://img.freepik.com/free-photo/purebred-dog-being-adorable-studio_23-2149016886.jpg?t=st=1717680234~exp=1717683834~hmac=4d4ae0ea6dd0228a8f67cf5a9c23feb5e57c1349302796f27f98e98a237b7c61&w=360"),
      fit: BoxFit.fill,
    )),
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Campo1(),
        Campo2(),
        BotonCalcular(context),
      ],
    )),
  );
}

final TextEditingController _alturaInicial = TextEditingController();
final TextEditingController _tiempo = TextEditingController();

Widget Campo1() {
  return Container(
    padding: EdgeInsets.all(10),
    child: (TextField(
      controller: _alturaInicial,
      decoration: InputDecoration(hintText: "Ingrese la altura inicial"),
      keyboardType: TextInputType.number,
    )),
  );
}

Widget Campo2() {
  return Container(
    padding: EdgeInsets.all(10),
    child: (TextField(
      controller: _tiempo,
      decoration: InputDecoration(hintText: "Ingrese el tiempo"),
      keyboardType: TextInputType.number,
    )),
  );
}

Widget BotonCalcular(context) {
  return Container(
    padding: EdgeInsets.all(10),
    child: (FilledButton(
      onPressed: () {
        /////////////////
        if (calculo() >= 1000) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("EXITO!"),
                  content: Text("Lanzamiento exitoso. Altura de: ${calculo()}"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("CERRAR"))
                  ],
                );
              });
        } else if (calculo() < 1000) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("FALLA!"),
                  content: Text("Lanzamiento ha fallado. Altura de: ${calculo()}"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("CERRAR"))
                  ],
                );
              });
        }
      },
      child: Text("Calcular"),
    )),
  );
}

double calculo() {
  double altura = double.tryParse(_alturaInicial.text) ?? 0.00;
  double tiempo = double.tryParse(_tiempo.text) ?? 0.00;
  double respuesta = altura + (1 / 2 * 20 * pow(tiempo, 2));
  return respuesta;
}
