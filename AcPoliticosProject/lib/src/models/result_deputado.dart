import 'dart:convert';

class ResultDeputado {
  int id;
  String uri;
  String nome;
  String siglaPartido;
  String uriPartido;
  String siglaUf;
  int idLegislatura;
  String urlFoto;
  String email;

  ResultDeputado(
    this.id,
    this.uri,
    this.nome,
    this.siglaPartido,
    this.uriPartido,
    this.siglaUf,
    this.idLegislatura,
    this.urlFoto,
    this.email,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'uri': uri,
        'nome': nome,
        'siglaPartido': siglaPartido,
        'uriPartido': uriPartido,
        'siglaUf': siglaUf,
        'idLegislatura': idLegislatura,
        'urlFoto': urlFoto,
        'email': email,
      };
}
