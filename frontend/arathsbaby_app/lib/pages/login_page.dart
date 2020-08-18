import "package:flutter_facebook_login/flutter_facebook_login.dart";
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;

  void initiateFacebookLogin() async {
    var login = FacebookLogin();
    var result = await login.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Surgio un error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Cancelada por el Usuario");
        break;
      case FacebookLoginStatus.loggedIn:
        onLoginStatusChange(true);
        break;
    }
  }

  void onLoginStatusChange(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      if (isLoggedIn = true) {
        Navigator.pushReplacementNamed(context, 'main');
      }
    });
  }

  Future btloginres(context) async {
    // Navigator.push(context, MaterialPageRoute(builder: (context) =>()));
    Navigator.pushReplacementNamed(context, 'main');
  }

  Widget buttonLogin() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        color: Colors.pinkAccent,
        textColor: Colors.white,
        child: Text('Entrar'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'main');
        },
      ),
    );
  }

  Widget buttonFacebook() {
    return Container(
        padding: const EdgeInsets.only(top: 28),
        child: RaisedButton(
            color: Colors.pinkAccent,
            textColor: Colors.white,
            child: Row(
              children: <Widget>[
                //isLoggedIn?Navigator.pushReplacementNamed(context, 'main'):

                Icon(FontAwesomeIcons.facebookSquare),
                Expanded(
                  child: Text(
                    'Entrar con Facebook',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onPressed: () => initiateFacebookLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 35.0),
            Image.asset(
              'assets/logo.png',
              height: 170,
            ),
            buttonLogin(),
            buttonFacebook(),
          ],
        ),
      ),
    );
  }
}
