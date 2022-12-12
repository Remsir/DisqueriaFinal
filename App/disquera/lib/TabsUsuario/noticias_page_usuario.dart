// ignore_for_file: unused_import, must_be_immutable

import 'package:disquera/Tabs/discos_agregar_page.dart';
import 'package:disquera/Tabs/noticias_agregar_page.dart';
import 'package:disquera/provider/discos_provider.dart';
import 'package:disquera/provider/firestore_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Tabs/discos_editar_page.dart';

class NoticiasUserPage extends StatefulWidget {
  @override
  State<NoticiasUserPage> createState() => _NoticiasUserPageState();
}

class _NoticiasUserPageState extends State<NoticiasUserPage> {
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
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
