import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ad1_Controller = TextEditingController();
  TextEditingController ap1_Controller = TextEditingController();
  TextEditingController ad2_Controller = TextEditingController();
  TextEditingController ap2_Controller = TextEditingController();
  double N1 = 0.0;
  double N2 = 0.0;
  double nota_final = 0.0;
  String situacao = "SITUAÇÃO";

  void limpar_campos() {
    setState(() {
      ad1_Controller.text = "";
      ap1_Controller.text = "";
      ad2_Controller.text = "";
      ap2_Controller.text = "";
      N1 = 0.0;
      N2 = 0.0;
      nota_final = 0.0;
      situacao = "SITUAÇÃO";
    });
  }

  double calcular(double ad, double ap){
    double nota = ((ad*2) + (ap*8)) / 10;
    return nota;
  }

  void calcular_N1() {
    setState(() {
      double ad1 = double.parse(ad1_Controller.text);
      double ap1 = double.parse(ap1_Controller.text);
      N1 = calcular(ad1, ap1);
    });
  }

  void calcular_N2() {
    setState(() {
      double ad2 = double.parse(ad2_Controller.text);
      double ap2 = double.parse(ap2_Controller.text);
      N2 = calcular(ad2, ap2);
    });
  }

  void calcular_situacao() {
    double nota = ((N1 + N2) / 2);
    setState(() {
      if (nota >= 6) {
        situacao = "Aprovado.\n Sua nota final é " + nota.toStringAsPrecision(2);
      } else {
        double nota_ap3 = 0.0;
        double maior = 0.0;
        if (N1 > N2) {
          maior = N1;
        } else {
          maior = N2;
        }
        nota_ap3 = 10 - maior;
        situacao = "Fazer AP3. \n Você precisa tirar " +
            nota_ap3.toStringAsPrecision(2) +
            "\n para ser aprovado.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notas CEDERJ"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: limpar_campos,
          )
        ],
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.school, size: 80.0, color: Colors.indigo),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "AD1"),
              controller: ad1_Controller,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "AP1"),
              controller: ap1_Controller,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "AD2"),
              controller: ad2_Controller,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "AP2"),
              controller: ap2_Controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  width: 100.0,
                  child: RaisedButton(
                    onPressed: calcular_N1,
                    child: Text(
                      "Calcular N1",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.indigo,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  width: 100.0,
                  child: RaisedButton(
                    onPressed: calcular_N2,
                    child: Text(
                      "Calcular N2",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.indigo,
                  ),
                ),
                Container(
                  width: 100.0,
                  child: RaisedButton(
                    onPressed: calcular_situacao,
                    child: Text(
                      "Situação final",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "N1: " + N1.toStringAsPrecision(2),
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                ),
                Text(
                  "N2: " + N2.toStringAsPrecision(2),
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  situacao,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}