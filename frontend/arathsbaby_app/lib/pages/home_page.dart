import 'package:arathsbaby_app/pages/principal_page.dart';

import 'package:flutter/material.dart';
import './products_page.dart';
import './user_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture = "";
  String otherProfilePicture = "";
  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Araths Baby"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 38,
                  ),
                  /*if (_listaCarro.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          //_listaCarro.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),*/
                ],
              ),
              onTap: () {
               /* if (_listaCarro.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                    ),
                  );*/
              },
            ),
          )
        ],
        backgroundColor: Colors.pinkAccent,
      ),
      endDrawer: new Drawer(
        child: Container(
          color: Colors.pinkAccent[50],
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Sergio Alejo"),
                accountEmail: new Text("s@gmail.com"),
                currentAccountPicture: new GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new UserPage("Usuario")));
                  },
                  child: new CircleAvatar(
                    backgroundImage: AssetImage("assets/user.jpg"),
                  ),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/logo.png"))),
              ),
              new ListTile(
                title: new Text("Productos"),
                trailing: new Icon(Icons.view_list),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ProductsPage()));
                },
              ),
              new ListTile(
                title: new Text("Pruebas"),
                trailing: new Icon(Icons.new_releases),
                onTap: () {
                  Navigator.of(context).pop();
                  //Navigator.of(context).push(new MaterialPageRoute(builder : (BuildContext context) => new PruebasPage());
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
      ),
      body: MyHomePage(),
    );
  }
}
