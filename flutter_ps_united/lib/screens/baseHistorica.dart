import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter_ps_united/Repository/GetRelatorios.dart';
import 'package:flutter_ps_united/models/Relatorios.dart';
import 'package:mobx/mobx.dart';

class BaseHistorica extends StatefulWidget {
  @override
  _BaseHistoricaState createState() => _BaseHistoricaState();
}

class _BaseHistoricaState extends State<BaseHistorica> {
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
    final title = 'Base Histórica';
    return 
    MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            Container(
            child: Padding(
            padding: EdgeInsets.only(top: 50.0, bottom: 50.0, left: 50, right: 50),
            child:MaterialButton(
            color: Colors.deepOrangeAccent,
            onPressed: () async {
              final List<DateTime> picked = await DateRangePicker.showDatePicker(
                  context: context,
                  initialFirstDate: new DateTime.now(),
                  initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                  firstDate: new DateTime(2015),
                  lastDate: new DateTime(DateTime.now().year + 2)
              );
              if (picked != null && picked.length == 2) {
                  print(picked);
              }
            },
            child: new Text("Escolha uma data")
        )
          )),
            ListTile(
              title: Text('Oceano Atlântico'),
              leading: Icon(Icons.add_location_rounded),
              trailing: Text('PH: 13 Area Geografica: 106.500.000 km² Sensor: 1'),
            ),
            ListTile(
              title: Text('Oceano Pacífico'),
              leading: Icon(Icons.add_location_rounded),
              trailing: Text('PH: 2 Area Geografica: 165.200.000 km² Sensor: 2'),
            ),
            ListTile(
              title: Text('Oceano Glacial Ártico'),
              leading: Icon(Icons.add_location_rounded),
              trailing: Text('PH: 10 Area Geografica: 14.060.000 km² Sensor: 3'),
            ),
          ],)
      )
    );
  }
}
