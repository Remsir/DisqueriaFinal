// ignore_for_file: unused_import

import 'package:disquera/Clases/Expander.dart';
import 'package:disquera/Screen/agregar_screen.dart';
import 'package:disquera/Screen/home_screen.dart';
import 'package:disquera/Services/Auth_email.dart';
import 'package:disquera/Tabs/discos_page.dart';
import 'package:disquera/Tabs/inicio.dart';
import 'package:disquera/Tabs/noticias_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeTab extends StatelessWidget {
  final styleTextRow = new TextStyle(fontSize: 32, color: Colors.red);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Disquera Nightray'),
            leading: Icon(Icons.disc_full),
            backgroundColor: Colors.black87,
            actions: [
              PopupMenuButton(
                onSelected: (opcion) {
                  AuthServi authServi = new AuthServi();
                  authServi.cerrarSesion();
                },
                itemBuilder: ((context) => [
                      PopupMenuItem(
                        value: 'Salir',
                        child: Text('Cerrar Sesion'),
                      )
                    ]),
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Inicio',
                  icon: Icon(MdiIcons.home),
                ),
                Tab(
                  text: 'Biblioteca',
                  icon: Icon(Icons.my_library_music_sharp),
                ),
                Tab(
                  text: 'Noticias',
                  icon: Icon(MdiIcons.newspaper),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            InicioPage(),
            DiscosPage(),
            /* 
            ExpanderSpacerPage(), */
            NoticiasPage()
          ]),
        ),
      ),
    );
  }
}
