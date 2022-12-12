import 'package:disquera/Services/Auth_email.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passCtrl = new TextEditingController();
  String errorText = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disquera Nightray'),
        leading: Icon(Icons.disc_full),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Registro de usuario',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ingrese email';
                  } else {
                    return null;
                  }
                },
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ingrese contraseña';
                  } else {
                    return null;
                  }
                },
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            padding: EdgeInsets.all(10),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        child: Text('Crear Cuenta'),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            AuthServi authServi = new AuthServi();

                            authServi
                                .crearCuenta(
                                    emailCtrl.text.trim(), passCtrl.text.trim())
                                .catchError((ex) {
                              error = ex.toString();
                              setState(() {
                                errorText = ex.toString();
                              });
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        errorText,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
