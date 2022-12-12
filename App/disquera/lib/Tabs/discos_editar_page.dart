import 'package:disquera/provider/discos_provider.dart';
import 'package:flutter/material.dart';

class DiscosEditarPage extends StatefulWidget {
  final int id;
  final String nombre;
  final String autor;
  final String genero;

  DiscosEditarPage(
      {Key? key,
      required this.id,
      required this.nombre,
      required this.autor,
      required this.genero})
      : super(key: key);

  @override
  State<DiscosEditarPage> createState() => _DiscosEditarPageState();
}

class _DiscosEditarPageState extends State<DiscosEditarPage> {
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController autorCtrl = new TextEditingController();
  TextEditingController generoCtrl = new TextEditingController();
  String errorNombreMsg = '';
  String errorAutorMsg = '';
  String errorGeneroMsg = '';

  @override
  void initState() {
    super.initState();
    nombreCtrl.text = widget.nombre;
    autorCtrl.text = widget.autor;
    generoCtrl.text = widget.genero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Disco'),
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
                child: Text('Editar Disco'),
                onPressed: () => discoEditar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void discoEditar() async {
    DiscosProvider provider = new DiscosProvider();
    var data = await provider.discosEditar(widget.id, nombreCtrl.value.text,
        autorCtrl.value.text, generoCtrl.value.text);
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
      });
    }
  }
}
