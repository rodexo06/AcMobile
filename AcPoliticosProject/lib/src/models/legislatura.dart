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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uri'] = uri;
    data['dataInicio'] = dataInicio;
    data['dataFim'] = dataFim;
    return data;
  }
}
