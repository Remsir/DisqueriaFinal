import 'package:disquera/Services/Auth_email.dart';
import 'package:disquera/Tabs/registro_page.dart';
import 'package:disquera/provider/Auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final labelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final textStyle = TextStyle(color: Colors.white);
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController PassCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Inicio Sesion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 350,
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.indigo[200],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Inicio de Sesion',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.center,
                  child: Text('Ingrese sus datos', style: textStyle)),
              TextField(
                controller: emailCtrl,
                style: textStyle,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    InputDecoration(labelText: 'Email', labelStyle: labelStyle),
              ),
              TextField(
                controller: PassCtrl,
                style: textStyle,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Contraseña', labelStyle: labelStyle),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text('Iniciar Sesion'),
                  onPressed: (() {
                    AuthServi authServi = new AuthServi();
                    authServi.iniciarSesion(
                        emailCtrl.text.trim(), PassCtrl.text.trim());
                  }),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text(
                    'CrearCuenta',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    MaterialPageRoute route = new MaterialPageRoute(
                        builder: (context) => RegistroPage());
                    Navigator.push(context, route);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
