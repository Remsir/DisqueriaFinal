import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido a Disqueria Nightray',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Image(
                      width: 400,
                      height: 550,
                      image: AssetImage('assets/ds.jpg')),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
