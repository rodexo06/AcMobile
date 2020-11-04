class Partido {
  int idPartido;
  String sigla;
  String nome;
  String uri;
  int idLegislatura;

  Partido(this.idPartido, this.sigla, this.nome, this.uri, this.idLegislatura);

  Partido.fromJson(Map<String, dynamic> json, int idLegis) {
    idPartido = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
    uri = json['uri'];
    idLegislatura = idLegis;
  }
  Partido.fromJsonDb(Map<String, dynamic> json) {
    idPartido = json['id_partido'];
    sigla = json['sigla'];
    nome = json['nome_partido'];
    uri = json['uri_partido'];
    idLegislatura = json['id_legislatura'];
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id_partido'] = idPartido;
    data['sigla'] = sigla;
    data['nome_partido'] = nome;
    data['uri_partido'] = uri;
    data['id_legislatura'] = idLegislatura;
    return data;
  }
}
