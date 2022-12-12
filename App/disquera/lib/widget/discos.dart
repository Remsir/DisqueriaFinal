// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Discos extends StatelessWidget {
  late String _nombre, _precio;
  Discos({String? nombre, String? precio}) {
    //this._nombre = nombre!;
    //this._precio = precio!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: 400,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.black87),
        child: Column(children: [
          Container(
            child: ListTile(
                leading: Icon(
                  MdiIcons.disc,
                  color: Colors.white70,
                ),
                title: Text('Banda', style: TextStyle(color: Colors.white)),
                subtitle: Text('Disco', style: TextStyle(color: Colors.white)),
                trailing:
                    Text('Precio', style: TextStyle(color: Colors.white))),
          ),
        ]));
  }
}
