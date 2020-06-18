import 'package:flutter/material.dart';
import './products_page.dart';
import './user_page.dart';
import './pruebas_page.dart';

class HomePage extends StatefulWidget {
    // This widget is the root of your application.
  @override
  _HomePageState createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage>{
  String mainProfilePicture = "https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg";
String otherProfilePicture ="https://cdn2.vectorstock.com/i/1000x1000/41/11/flat-business-woman-user-profile-avatar-icon-vector-4334111.jpg";



void switchUser(){
  String backupString = mainProfilePicture;
  this.setState(() {
    mainProfilePicture = otherProfilePicture;
    otherProfilePicture = backupString;
  });
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Araths Baby App"), backgroundColor: Colors.pinkAccent,),
      endDrawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                            accountName: new Text ("Sergio Alejo"),
                            accountEmail: new Text("s@gmail.com"),
                            currentAccountPicture: 
                            new GestureDetector(
                              onTap:(){ 
                                Navigator.of(context).pop();
                                Navigator.of(context).push(new MaterialPageRoute(builder : (BuildContext context) => new UserPage("Usuario")));
                                },
                              child: new CircleAvatar(
                                backgroundImage: new NetworkImage (mainProfilePicture),
                              ),
                            ),
                            
                            decoration: new BoxDecoration(
                              image : new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage("https://i.pinimg.com/originals/7b/40/40/7b4040ba378868e0594a1049ca4cae3b.jpg")
                                )
                            ),
            ),
            new ListTile(
              title: new Text("Productos"),
              trailing: new Icon(Icons.view_list),
              onTap: () {
                Navigator.of(context).pop();
                 Navigator.of(context).push(new MaterialPageRoute(builder : (BuildContext context) => new ProductsPage()));
              },
              
            ),
            new ListTile(
              title: new Text("Categorias"),
              trailing: new Icon(Icons.filter_list),
                       
             
            ),
            new ListTile(
              title: new Text("Pruebas"),
              trailing: new Icon(Icons.new_releases),
              onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).push(new MaterialPageRoute(builder : (BuildContext context) => new PruebasPage()));
              },
            ),
            
            new Divider(),
            new ListTile(
              title: new Text("Cerrar"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(), 
            ),
          ],
        ),
        ),
      body: new Center(
        
        
    ),
    );
    
  }
}


  
