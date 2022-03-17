import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();

  // AJOUT DE FONCTION CREATION
  cree() async {
    try {} catch (e) {
      print(e);
    }
  }

 // AJOUT DE FONCTION MODIFICATION 
  modifie() async {
    try {} catch (e) {
      print(e);
    }
  }

  // AJOUT DE FONCTION SUPPRESSION
  supprimer() async {
    try {} catch (e) {
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
