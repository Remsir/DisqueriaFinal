import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance.collection('Noticias').snapshots();
  }

  Future noticiaAgregar(String noticia) async {
    FirebaseFirestore.instance
        .collection('Noticias')
        .doc()
        .set({'cuerpo': noticia});
  }

  Future noticiaEditar(String noticia) async {
    FirebaseFirestore.instance
        .collection('Noticias')
        .doc()
        .update({'cuerpo': noticia});
  }

  Future noticiasBorrar(String noticiaId) async {
    FirebaseFirestore.instance.collection('Noticias').doc(noticiaId).delete();
  }
}
