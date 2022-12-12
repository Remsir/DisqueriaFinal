// ignore_for_file: unused_import, must_be_immutable

import 'package:disquera/Tabs/discos_agregar_page.dart';
import 'package:disquera/Tabs/noticias_agregar_page.dart';
import 'package:disquera/provider/discos_provider.dart';
import 'package:disquera/provider/firestore_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'discos_editar_page.dart';

class NoticiasPage extends StatefulWidget {
  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  DiscosProvider provider = new DiscosProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: FirestoreService().noticias(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                // ignore: prefer_const_constructors
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  var noticia = snapshot.data.docs[index];
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      leading: Icon(MdiIcons.newspaperCheck),
                      title: Text(noticia['cuerpo']),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Eliminar',
                        color: Colors.red[400],
                        icon: MdiIcons.trashCanOutline,
                        onTap: () {
                          confirmDialog(
                                  context, snapshot.data.docs[index]['cuerpo'])
                              .then((value) {
                            if (value) {
                              FirestoreService().noticiasBorrar(noticia.id);
                              ;
                            }
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.all(10),
                textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onPressed: () => navegarNoticiasAgregar(context),
            child: Text('Agregar Noticia'),
          ),
        )
      ],
    );
  }

  void navegarNoticiasAgregar(BuildContext context) {
    final route =
        new MaterialPageRoute(builder: (context) => NoticiasAgregarPage());
    Navigator.push(context, route).then((valor) {
      setState(() {});
    });
  }

  Future<dynamic> confirmDialog(BuildContext context, String nombre) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmar borrado'),
            content: Text('¿Desea borrar el disco $nombre?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Cancelar')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.all(10),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Aceptar')),
            ],
          );
        });
  }
}
