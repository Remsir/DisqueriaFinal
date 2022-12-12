import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class ExpanderSpacerPage extends StatelessWidget {
  const ExpanderSpacerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Expander and Spacer'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text('Ancho:' + size.width.round().toString()),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6.0),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Examplebox(
                      color: 0xff6c21cf,
                      text: '1',
                    ),
                  ),
                  Examplebox(
                    color: 0xffe8d66d,
                    text: '2',
                  ),
                  Examplebox(
                    color: 0xff56c77f,
                    text: '3',
                  ),
                  Expanded(
                    flex: 1,
                    child: Examplebox(
                      color: 0xffa34561,
                      text: '4',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 100,
              child: Row(
                children: [
                  Examplebox(
                    color: 0xff6c21cf,
                    text: '1',
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Examplebox(
                    color: 0xffe8d66d,
                    text: '2',
                  ),
                  Examplebox(
                    color: 0xff56c77f,
                    text: '3',
                  ),
                  Spacer(),
                  Examplebox(
                    color: 0xffa34561,
                    text: '4',
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.cyan,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        color: Colors.yellowAccent,
                      ),
                      Positioned(
                        bottom: 50,
                        right: 0,
                        child: Container(
                          height: 180,
                          width: 180,
                          color: Colors.purpleAccent,
                        ),
                      ),
                    ],
                  )),
            ),
            Row(
              children: [
                Container(
                  child: Text('Desea recibir informacion'),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: LiteRollingSwitch(
                    width: 100,
                    value: true,
                    textOn: "On",
                    textOff: "Off",
                    colorOn: Colors.greenAccent,
                    colorOff: Colors.redAccent,
                    iconOn: Icons.done,
                    iconOff: Icons.alarm_off,
                    textSize: 18,
                    onChanged: (bool position) {
                      print("Position");
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onTap: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Examplebox extends StatelessWidget {
  const Examplebox({
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  final int color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: 70,
      color: Color(this.color),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
//Agregar
    //git init
//git add .
//git commit -m "mensaje"
//git branch -M main
//git remote copiar ruta
//git push -u origin main
//actualizar
//git add .
//git commit -m "mensaje"
//git push -u origin main
  }
}
