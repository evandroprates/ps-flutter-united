import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_ps_united/Repository/GetRelatorios.dart';
import 'package:flutter_ps_united/models/Relatorios.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    var relatorios = new List<Relatorio>();

    @observable
    _getRelatorios() {
    API.getRelatorios().then((response) {
      @action
      Iterable list = json.decode(response.body);
      relatorios = list.map((model) => Relatorio.fromJson(model)).toList();
    });
  }

    initState() {
    super.initState();
    _getRelatorios();
  }

  dispose() {
    super.dispose();
  }

   @override
  Widget build (BuildContext context){
    final title = 'Relatórios - Tempo Real';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Observer(
        builder: (context) =>
          ListView.builder(
            itemCount: relatorios.length,
            itemBuilder: (_, index) => Text('PH: ' + relatorios[index].ph +  'Area Geografica: ' + relatorios[index].areaGeografica +  'Sensor: ' + relatorios[index].sensor),
          ),
        ),
      )
    );
  }
}
