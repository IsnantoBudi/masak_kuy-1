import 'package:flutter/material.dart';
import 'package:masak_kuy/pages/Tentang.dart';
import 'recipe_details.dart';
import 'package:masak_kuy/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback, this.post})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  final String post;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Scaffold(
        appBar: AppBar(title: const Text('Masak Kuy App')),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Masak Kuy"),
                accountEmail: Text("masakkuy@gmail.com"),
                decoration: BoxDecoration(color: Colors.indigo),
              ),
              ListTile(
                leading: new Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.info_outline),
                title: Text('TENTANG'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tentang()),
                  );
                },
              ),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              ListTile(
                  trailing: new Icon(Icons.account_circle),
                  title: Text('LOGOUT'),
                  onTap: signOut),
            ],
          ),
        ),
        //menambahkan body dihomepage (lukas)
        body: Container(
          width: _width,
          height: _height,
          color: Colors.blue,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _height * 0.10,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 44, color: Colors.white),
                  ),
                  SizedBox(
                    height: _height * 0.10,
                  ),
                  AutoSizeText(
                    "Let's start your cooking",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.10,
                  ),
                  //fix raisedbutton dengan navigator ke recipedetails
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0,
                            bottom: 10.0, left: 30.0, right: 30.0),

                        child: Text("Get Started", style: TextStyle(color: Colors.blueAccent,
                            fontSize: 28, fontWeight: FontWeight.w300),),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecipeDetails('post')),
                        );
                      }
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}