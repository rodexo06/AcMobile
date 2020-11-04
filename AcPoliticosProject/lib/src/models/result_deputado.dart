class ResultDeputado {
  int idDeputado;
  String uri;
  String nome;
  String siglaPartido;
  String siglaUf;
  int idLegislatura;
  String urlFoto;
  String email;

  ResultDeputado(
    this.idDeputado,
    this.uri,
    this.nome,
    this.siglaPartido,
    this.siglaUf,
    this.idLegislatura,
    this.urlFoto,
    this.email,
  );

  ResultDeputado.fromJson(Map<String, dynamic> json) {
    idDeputado = json['id'];
    uri = json['uri'];
    nome = json['nome'];
    siglaPartido = json['siglaPartido'];
    siglaUf = json['siglaUf'];
    idLegislatura = json['idLegislatura'];
    urlFoto = json['urlFoto'];
    email = json['email'];
  }

  ResultDeputado.fromJsonDb(Map<String, dynamic> json) {
    idDeputado = json['id_dep'];
    uri = json['uri_dep'];
    nome = json['nome_dep'];
    siglaPartido = json['sigla_partido'];
    siglaUf = json['sigla_uf'];
    idLegislatura = json['id_legislatura'];
    urlFoto = json['url_foto'];
    email = json['email'];
  }
  Map<String, dynamic> toMap() => {
        'id_dep': idDeputado,
        'sigla_partido': siglaPartido,
        'nome_dep': nome,
        'uri_dep': uri,
        'sigla_uf': siglaUf,
        'id_legislatura': idLegislatura,
        'url_foto': urlFoto,
        'email': email,
      };
}
