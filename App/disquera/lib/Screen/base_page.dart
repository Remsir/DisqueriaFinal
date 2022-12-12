import 'package:disquera/Screen/login_screen.dart';
import 'package:disquera/Tabs/discos_page.dart';
import 'package:disquera/Tabs/home_page.dart';
import 'package:disquera/Tabs/registro_page.dart';
import 'package:disquera/TabsUsuario/home_page_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String aux = '';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<User?>(context);
    return usuario == null
        ? LoginPage()
        : usuario.uid == '4re4zjqz4Dg0sq65ayAmRsPXvz53'
            ? HomeTab()
            : HomeTabUser();
    // return RegistroPage();
  }
}
