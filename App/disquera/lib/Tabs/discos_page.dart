// ignore_for_file: unused_import, must_be_immutable

import 'package:disquera/Tabs/discos_agregar_page.dart';
import 'package:disquera/provider/discos_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'discos_editar_page.dart';

class DiscosPage extends StatefulWidget {
  @override
  State<DiscosPage> createState() => _DiscosPageState();
}

class _DiscosPageState extends State<DiscosPage> {
  DiscosProvider provider = new DiscosProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: provider.getDiscos(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                // ignore: prefer_const_constructors
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      leading: Icon(Icons.music_video_rounded),
                      title: Text(snapshot.data[index]['nombre']),
                      subtitle: Text(snapshot.data[index]['genero']),
                      trailing: Text(snapshot.data[index]['autos']),
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Editar',
                        color: Colors.blue[400],
                        foregroundColor: Colors.white,
                        icon: MdiIcons.pen,
                        onTap: () => navegarDiscosEditar(
                            context,
                            snapshot.data[index]['id'],
                            snapshot.data[index]['nombre'],
                            snapshot.data[index]['autos'],
                            snapshot.data[index]['genero']),
                      )
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Eliminar',
                        color: Colors.red[400],
                        icon: MdiIcons.trashCanOutline,
                        onTap: () {
                          confirmDialog(context, snapshot.data[index]['nombre'])
                              .then((value) {
                            if (value) {
                              setState(() {
                                provider
                                    .discosBorrar(snapshot.data[index]['id']);
                                snapshot.data.removeAt(index);
                              });
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
            onPressed: () => navegarDiscosAgregar(context),
            child: Text('Agregar Disco'),
          ),
        )
      ],
    );
  }

  void navegarDiscosAgregar(BuildContext context) {
    final route =
        new MaterialPageRoute(builder: (context) => DiscosAgregarPage());
    Navigator.push(context, route).then((valor) {
      setState(() {});
    });
  }

  void navegarDiscosEditar(BuildContext context, int id, String nombre,
      String autor, String genero) {
    final route = new MaterialPageRoute(
        builder: (context) => DiscosEditarPage(
              id: id,
              nombre: nombre,
              autor: autor,
              genero: genero,
            ));
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
