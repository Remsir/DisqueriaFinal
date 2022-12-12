import 'package:disquera/provider/discos_provider.dart';
import 'package:flutter/material.dart';

class DiscosAgregarPage extends StatefulWidget {
  DiscosAgregarPage({Key? key}) : super(key: key);

  @override
  State<DiscosAgregarPage> createState() => _DiscosAgregarPageState();
}

class _DiscosAgregarPageState extends State<DiscosAgregarPage> {
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController autorCtrl = new TextEditingController();
  TextEditingController generoCtrl = new TextEditingController();
  String errorNombreMsg = '';
  String errorAutorMsg = '';
  String errorGeneroMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Disco'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                    labelText: 'Nombre', hintText: 'Nombre del disco'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorNombreMsg,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: autorCtrl,
                decoration: InputDecoration(
                    labelText: 'Autor', hintText: 'Autor del disco'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorAutorMsg,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: generoCtrl,
                decoration: InputDecoration(
                    labelText: 'Genero', hintText: 'Genero del disco'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorGeneroMsg,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.all(10),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text('Agregar Disco'),
                onPressed: () => discoAgregar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void discoAgregar() async {
    DiscosProvider provider = new DiscosProvider();
    var data = await provider.discosAgregar(
        nombreCtrl.value.text, autorCtrl.value.text, generoCtrl.value.text);

    if (data == null) {
      Navigator.pop(context);
    } else {
      setState(() {
        if (data['errors']['nombre'] == null) {
          errorNombreMsg = '';
        } else {
          errorNombreMsg = data['errors']['nombre'][0];
        }
        if (data['errors']['autos'] == null) {
          errorAutorMsg = '';
        } else {
          errorAutorMsg = data['errors']['autos'][0];
        }
        if (data['errors']['genero'] == null) {
          errorGeneroMsg = '';
        } else {
          errorGeneroMsg = data['errors']['genero'][0];
        }

        //errorMsg = "Debe llenar todos los campos" Campo nombre requerido (and 2 more errors);
      });
    }
  }
}
