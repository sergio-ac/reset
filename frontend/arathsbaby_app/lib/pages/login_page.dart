import 'package:arathsbaby_app/pages/home_page.dart';
import 'package:arathsbaby_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future btloginres(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
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

  Widget buttonLogin() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        color: Colors.pinkAccent,
        textColor: Colors.white,
        child: Text('Entrar'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'homePage');
        },
      ),
    );
  }

  Widget linkRegister() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: InkWell(
        child: Text(
          'Crear una cuenta',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
      ),
    );
  }

  Widget oDivider() {
    return Container(
        padding: const EdgeInsets.only(top: 28),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Divider(
              height: 1,
            )),
            Text('O'),
            Expanded(
                child: Divider(
              height: 1,
            )),
          ],
        ));
  }

  Widget buttonFacebook() {
    return Container(
        padding: const EdgeInsets.only(top: 28),
        child: RaisedButton(
            color: Colors.pinkAccent,
            textColor: Colors.white,
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.facebookSquare),
                Expanded(
                  child: Text(
                    'Entrar con Facebook',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onPressed: () {}));
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
              height: 170,
            ),
            inputEmail(),
            inputPassword(),
            buttonLogin(),
            linkRegister(),
            oDivider(),
            buttonFacebook(),
          ],
        ),
      ),
    );
  }
}
