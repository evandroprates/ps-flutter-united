
class Relatorio {
  int id;
  String ph;
  String areaGeografica;
  String sensor;

  Relatorio(int id, String ph, String areaGeografica, String sensor) {
    this.id = id;
    this.ph = ph;
    this.areaGeografica = areaGeografica;
    this.sensor = sensor;
  }

  Relatorio.fromJson(Map json)
      : ph = json['ph'],
        areaGeografica = json['areaGeografica'],
        sensor = json['sensor'],
        id = json['id'];

  Map toJson() {
    return {'id': id, 'ph': ph, 'areaGeografica': areaGeografica, 'sensor': sensor };
  }
}