import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ps_united/screens/Home.dart';
import 'package:flutter_ps_united/screens/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
   final usuario = TextEditingController();
   final senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              // child: Center(
              //   child: Container(
              //       width: 200,
              //       height: 150,
              //       /*decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(50.0)),*/
              //       child: Text('Olá'),
              // ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usuario,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                    hintText: 'Informe o usuario'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: senha,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    hintText: 'Informe a senha'),
              ),
            ),
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                // log(usuario.text);
                // log(senha.text);
                if (usuario.text == '123' && senha.text == '123') {
                   Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_) => Nav()));
                }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
