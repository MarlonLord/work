import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
    runApp(MaterialApp(
      home: Home(),
    ),);
}
  
  class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home>{

    TextEditingController precoGasolinaController = new TextEditingController();
    TextEditingController precoEtanolController = new TextEditingController();

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String _info = "Informe os preços dos combustiveis!";

  void _resetFields(){
    precoGasolinaController.text = "";
    precoEtanolController.text = "";
    setState((){
    _info = "Informe os preços dos combustiveis!";
    _formKey = GlobalKey<FormState>();
    });
  }

  void _calcularMelhorCombustivel(){
    setState((){
    double precoEtanol = double.parse(precoEtanolController.text);
    double precoGasolina = double.parse(precoGasolinaController.text);
    double coeficiente = precoEtanol / precoGasolina;
    print(coeficiente);
    _info = (coeficiente < 0.7) ? "Etanol é a melhor opção" : "Gasolina é a melhor opção";
    });
  }

    @override 
    Widget build(BuildContext context) {
      return Scaffold( 
        appBar: AppBar(
          title: Text("Qual combustível?"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh),
            onPressed: _resetFields)
          ],
        ),

        body: SingleChildScrollView(  
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

          child: Form(
            key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.poll, size: 100.0, color: Colors.blue),

              TextFormField(
                controller: precoGasolinaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Gasolina R\$",
                  labelStyle: TextStyle(color: Colors.blue)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 20.0),

                validator: (value){
                  if (value.isEmpty){
                    return "Informe o preço da gasolina!";
                  }
                }
              ),
              TextFormField(
                controller: precoEtanolController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Etanol R\$",
                  labelStyle: TextStyle(color: Colors.blue)
                  ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 20.0),

                validator: (value){
                  if (value.isEmpty){
                    return "Informe o preço do etanol!";
                  }
                }
              ),

            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
              height: 50.0,
              child: RaisedButton(
                  onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calcularMelhorCombustivel();
                      }
                  },
                  child: Text("Calcular",
                                style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.blue
              )
            )
            ),

            Text(_info, textAlign: TextAlign.center, style: TextStyle(color: Colors.blue, fontSize: 20.0)),

            Text("Informações",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 20.0),
            )
            ]
        )
        )
        )
        );
    }
}