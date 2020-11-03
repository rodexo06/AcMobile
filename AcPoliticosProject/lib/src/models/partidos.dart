class Partidos {
  int id;
  String sigla;
  String nome;
  String uri;

  Partidos(this.id, this.sigla, this.nome, this.uri);

  Partidos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sigla'] = sigla;
    data['nome'] = nome;
    data['uri'] = uri;
    return data;
  }
}
