class Legislatura {
  int id;
  String uri;
  String dataInicio;
  String dataFim;

  Legislatura(this.id, this.uri, this.dataInicio, this.dataFim);

  Legislatura.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uri = json['uri'];
    dataInicio = json['dataInicio'];
    dataFim = json['dataFim'];
  }

  Legislatura.fromJsonDb(Map<String, dynamic> json) {
    id = json['id_legis'];
    uri = json['uri_legis'];
    dataInicio = json['data_inicio'];
    dataFim = json['data_fim'];
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id_legis'] = id;
    data['uri_legis'] = uri;
    data['data_inicio'] = dataInicio;
    data['data_fim'] = dataFim;
    return data;
  }
}
