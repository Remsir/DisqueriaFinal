// ignore_for_file: unused_import, must_be_immutable

import 'package:disquera/Tabs/discos_agregar_page.dart';
import 'package:disquera/provider/discos_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Tabs/discos_editar_page.dart';

class DiscosPageUser extends StatefulWidget {
  @override
  State<DiscosPageUser> createState() => _DiscosPageUserState();
}

class _DiscosPageUserState extends State<DiscosPageUser> {
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
