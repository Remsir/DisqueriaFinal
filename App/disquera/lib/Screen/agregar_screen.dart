import 'package:flutter/material.dart';

class AgregarScreen extends StatefulWidget {
  AgregarScreen({Key? key}) : super(key: key);

  @override
  State<AgregarScreen> createState() => _AgregarScreenState();
}

class _AgregarScreenState extends State<AgregarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese el nombre',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese el nombre',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
