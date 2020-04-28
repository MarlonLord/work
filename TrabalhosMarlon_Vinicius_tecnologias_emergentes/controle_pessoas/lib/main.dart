import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Controle de Pessoas",
      home: Home(),
      
    ), //MaterialApp
  );
}

class Home extends StatefulWidget{ 
  @override 
  _HomeState createState() =>  _HomeState();

}
class _HomeState extends State<Home>{
  int _qtdePessoas = 0;
  void _changeQtdePessoas(int variante){
    setState((){
      _qtdePessoas += variante;
    });
  }

  @override
  Widget build(BuildContext context){
    return (
      Stack(
        children:<Widget>[
          Image.asset(
            "lib/fundo_supermercado.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
        
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas: $_qtdePessoas",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.2),
                child:
              FlatButton(
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 35.0, color: Colors.black),
                ),
                onPressed: () {
                _changeQtdePessoas(1);
                 },
              ),
              ),

              FlatButton(
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 35.0, color: Colors.black),
                ),
                onPressed: () {
                   _changeQtdePessoas(-1);
                },
              ),
            ],
          ),
          Text(
            "Pode entrar!",
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 25.00),
          ),
        ],
      ), //column
       
       
        ],
      )
    );
  }
}
