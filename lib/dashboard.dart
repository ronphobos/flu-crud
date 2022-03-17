import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();

  // CREATION D'UNE INSTANCE DE FIREBASE
  final firebase = FirebaseFirestore.instance;

  // AJOUT DE FONCTION CREATION
  cree() async {
    try {
      await firebase.collection('User')
      .doc(nom.text)
      .set({
        'nom' : nom.text,
        'email': email.text,
      });
    } catch (e) {
      print(e);
    }
  }

  // AJOUT DE FONCTION MODIFICATION
  modifie() async {
    try {
      firebase.collection('User').doc(nom.text).update({
        'nom' : nom.text,
      });
    } catch (e) {
      print(e);
    }
  }

  // AJOUT DE FONCTION SUPPRESSION
  supprimer() async {
    try {
       firebase.collection('User').doc(nom.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD FLUTTER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nom,
              decoration: InputDecoration(
                  labelText: "Le nom de l'utilisateur",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: "Le mail de l'utilisateur",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    cree();
                    nom.clear();
                    email.clear();
                  },
                  child: Text("Créer"),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    modifie();
                    nom.clear();
                    email.clear();
                  },
                  child: Text("Modifier"),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    supprimer();
                    nom.clear();
                    email.clear();
                  },
                  child: Text("Supprimé"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
