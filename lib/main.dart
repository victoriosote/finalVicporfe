import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

void main()=>runApp(App());
class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:" FINAAAALLL",
      debugShowCheckedModeBanner: false,
      home: Inicio(),

    );
  }
}
class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}


class _InicioState extends State<Inicio> {
  TextEditingController controller=TextEditingController();
    TextEditingController numcontroller=TextEditingController();
    actualizar(String hola){
      setState(() {
        controller.text=hola;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text("Finaaaal")),
       body: ListView(
         children: [
           Container(
              child: TextFormField(
                controller: numcontroller,
                decoration: InputDecoration(
                  hintText: "Ingrese numero",
                ),
              ),

           ),
                      Container(
              child: TextFormField(
                controller: controller,
              ),

           ),
           Container(
             child: FlatButton(
               onPressed: (){
                 Funcion(int.parse(controller.text));
               },
                  child:Text("Ingresar")
             ),
           )
         ],
       ),
    );
  }
Future<void>Funcion(int id)async
{
  String url="https://weblasthopevfa.azurewebsites.net/api/Values/"+id.toString();
  final response=await http.get(url,headers: {
    "Content-Type":"application/json",
    "Accept":"application/json"
  });
  print(json.decode(response.body));
  actualizar(response.body);
}
}
