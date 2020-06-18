import 'package:flutter/material.dart';

class UserPage extends StatelessWidget{
  final String pageText;
  UserPage(this.pageText);
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText),backgroundColor: Colors.pinkAccent,),
      body: new Center(child: new Text(pageText),
      
      )
    );
  }
}