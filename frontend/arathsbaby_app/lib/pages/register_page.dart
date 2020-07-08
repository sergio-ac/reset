import 'package:arathsbaby_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future btloginres(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget inputName() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Nombre'),
      ),
    );
  }

  Widget inputLastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Apellidos'),
      ),
    );
  }

  Widget inputUserName() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Nombre de perfil'),
      ),
    );
  }

  Widget inputEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Correo electrónico'),
      ),
    );
  }

  Widget inputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Contraseña'),
        obscureText: true,
      ),
    );
  }

  Widget inputPhone() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Número de teléfono'),
      ),
    );
  }


  Widget buttonRegister() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        color: Colors.pinkAccent,
        textColor: Colors.white,
        child: Text('Crear'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'homePage');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/arathslogo.jpg',
              height: 50,
            ),
            inputName(),
            inputLastName(),
            inputUserName(),
            
            inputEmail(),
            inputPassword(),
            inputPhone(),
            buttonRegister(),
          ],
        ),
      ),
    );
  }
}
