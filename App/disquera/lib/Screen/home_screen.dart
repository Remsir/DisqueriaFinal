import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  String jornadaSeleccionada = 'd';
  bool Noticias = false;
  DateTime fechaseleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  final emailreguex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10))),
            child: Text(
              'Registro',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView(
                  children: [
                    campoNombre(),
                    campoApellido(),
                    campoEmail(),
                    campoFechaNacimiento(),
                    //campoJornada(),
                    campoNoticias(),
                  ],
                ),
              )),
          Spacer(),
          botonMatricula(),
        ]),
      ),
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Ingrese Nombre',
      ),
      validator: (nombres) {
        if (nombres!.isEmpty) {
          return 'Ingrese nombre';
        }
        return null;
      },
    );
  }

  TextFormField campoApellido() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ingrese Apellido'),
      validator: (apellido) {
        if (apellido!.isEmpty) {
          return 'Ingrese apellido';
        }
        return null;
      },
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: ' Email'),
      keyboardType: TextInputType.emailAddress,
      validator: (email) {
        if (email!.isEmpty) {
          return 'Ingrese email';
        }
        if (!RegExp(emailreguex).hasMatch(email)) {
          return 'formato invalido';
        }
        return null;
      },
    );
  }

  Widget campoFechaNacimiento() {
    return Row(
      children: [
        Text('Fecha de nacimiento: '),
        //Text('12-12-2012'),
        Text(fFecha.format(fechaseleccionada)),
        Spacer(),
        TextButton(
          child: Icon(Icons.calendar_today),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              locale: Locale('es', 'ES'),
            ).then((fecha) {
              setState(() {
                fechaseleccionada = fecha == null ? fechaseleccionada : fecha;
              });
            });
          },
        )
      ],
    );
  }

  // Widget campoJornada() {
  //   return Column(
  //     children: [
  //       RadioListTile<String>(
  //         groupValue: jornadaSeleccionada,
  //         title: Text('Jornada diurna'),
  //         value: 'd',
  //         onChanged: (jornada) {
  //           setState(() {
  //             jornadaSeleccionada = jornada!;
  //           });
  //         },
  //       ),
  //       RadioListTile<String>(
  //         groupValue: jornadaSeleccionada,
  //         title: Text('Jornada vespertina'),
  //         value: 'v',
  //         onChanged: (jornada) {
  //           setState(() {
  //             jornadaSeleccionada = jornada!;
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }

  SwitchListTile campoNoticias() {
    return SwitchListTile(
      title: Text('Desea recibir noticias'),
      value: Noticias,
      onChanged: ((noticias) {
        setState(() {
          Noticias = noticias;
        });
      }),
    );
  }

  Widget botonMatricula() {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Crear Cuenta'),
        onPressed: () {
          if (formKey.currentState!.validate()) print('OK');
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: EdgeInsets.all(10),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
//localizationsDelegates: [GlobalMaterialLocalizations.delegate],
  //    supportedLocales: [const Locale('es')], 