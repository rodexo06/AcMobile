class DespesasDeputado {
  int ano;
  int mes;
  String cnpjCpfFornecedor;
  String tipoDespesa;
  int codDocumento;
  String dataDocumento;
  String numDocumento;
  double valorDocumento;
  String urlDocumento;
  String nomeFornecedor;
  double valorLiquido;
  double valorGlosa;
  int codLote;
  int parcela;

  DespesasDeputado(
    this.ano,
    this.mes,
    this.cnpjCpfFornecedor,
    this.tipoDespesa,
    this.codDocumento,
    this.dataDocumento,
    this.numDocumento,
    this.valorDocumento,
    this.urlDocumento,
    this.nomeFornecedor,
    this.valorLiquido,
    this.valorGlosa,
    this.codLote,
    this.parcela,
  );

  DespesasDeputado.fromJson(Map<String, dynamic> json) {
    ano = json['ano'];
    mes = json['mes'];
    cnpjCpfFornecedor = json['cnpjCpfFornecedor'];
    tipoDespesa = json['tipoDespesa'];
    codDocumento = json['codDocumento'];
    dataDocumento = json['dataDocumento'];
    numDocumento = json['numDocumento'];
    valorDocumento = json['valorDocumento'];
    urlDocumento = json['urlDocumento'];
    nomeFornecedor = json['nomeFornecedor'];
    valorLiquido = json['valorLiquido'];
    valorGlosa = json['valorGlosa'];
    codLote = json['codLote'];
    parcela = json['parcela'];
  }

  Map<String, dynamic> toMap() => {
        'ano': ano,
        'mes': mes,
        'cnpjCpfFornecedor': cnpjCpfFornecedor,
        'tipoDespesa': tipoDespesa,
        'codDocumento': codDocumento,
        'dataDocumento': dataDocumento,
        'numDocumento': numDocumento,
        'valorDocumento': valorDocumento,
        'urlDocumento': urlDocumento,
        'nomeFornecedor': nomeFornecedor,
        'valorLiquido': valorLiquido,
        'valorGlosa': valorGlosa,
        'codLote': codLote,
        'parcela': parcela,
      };
}
