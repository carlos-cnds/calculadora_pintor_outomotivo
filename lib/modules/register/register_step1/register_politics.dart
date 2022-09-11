import 'package:flutter/material.dart';

class RegisterPolitics extends StatelessWidget {
  const RegisterPolitics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Pintor Automotivo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Termos de Uso",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              '''Esse aplicativo é uma ferramenta desenvolvida para facilitar o dia a dia do pintor automotivo na catálise e diluição de revestimentos como vernizes, tintas e primers. Os dados utilizados para os cálculos de mistura por peso são de acordo com as informações fornecidas pelos fabricantes através dos rótulos e tabelas de catálise, fichas técnicas e FISPQ disponibilizados nos sites ou fornecidos pelos suportes técnicos. Não nos responsabilizamos por uso incorreto desta ferramenta.''',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
