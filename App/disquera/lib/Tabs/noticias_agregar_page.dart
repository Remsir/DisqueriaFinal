import 'package:disquera/provider/discos_provider.dart';
import 'package:disquera/provider/firestore_service.dart';
import 'package:flutter/material.dart';

class NoticiasAgregarPage extends StatefulWidget {
  NoticiasAgregarPage({Key? key}) : super(key: key);

  @override
  State<NoticiasAgregarPage> createState() => _NoticiasAgregarPageState();
}

class _NoticiasAgregarPageState extends State<NoticiasAgregarPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController cuerpoCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Noticia'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ingrese cuerpo';
                    } else {
                      return null;
                    }
                  },
                  controller: cuerpoCtrl,
                  decoration: InputDecoration(
                      labelText: 'cuerpo', hintText: 'Cuerpo de la noticia'),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.all(10),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  child: Text('Agregar Noticia'),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      FirestoreService().noticiaAgregar(cuerpoCtrl.text.trim());
                      Navigator.pop(context);
                    }
                    FirestoreService().noticiaAgregar(cuerpoCtrl.text.trim());
                    Navigator.pop(context);
                  },
                  //onPressed: () => discoAgregar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void discoAgregar() async {
  //   DiscosProvider provider = new DiscosProvider();
  //   var data = await provider.discosAgregar(
  //       cuerpoCtrl.value.text);

  //   if (data == null) {
  //     Navigator.pop(context);
  //   } else {
  //     setState(() {
  //     });
  //   }
  // }
}
