import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PruebasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pruebas Page',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: Pruebas(),
    );
  }
}

class Pruebas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        title: Text("ArathsBabyPruebas"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Bienvenidos",
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context,position){
              return Padding(padding: const EdgeInsets.all(8.0),
              
              child: Container(
                width: 200.0,
                height: 150.0,
                color: Colors.pinkAccent,
                child:Text("Posición $position"),
              ),
              );
            }
          ),
          ),
          
        ],
      ),
    );
  }
}
