class ResultUfs {
  int idUf;
  String sigla;
  String nome;

  ResultUfs(
    this.idUf,
    this.sigla,
    this.nome,
  );

  ResultUfs.fromJson(Map<String, dynamic> json) {
    idUf = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }
  ResultUfs.fromJsonDb(Map<String, dynamic> json) {
    idUf = json['id_uf'];
    sigla = json['sigla'];
    nome = json['nome_uf'];
  }
  Map<String, dynamic> toMap() => {
        'id_uf': idUf,
        'sigla': sigla,
        'nome_uf': nome,
      };
}
