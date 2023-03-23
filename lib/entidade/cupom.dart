class Cupom {
  String descricao;
  double valorDesconto;
  double valorDescontoPermitido = 0.15;

  Cupom({required this.descricao, required this.valorDesconto}) {
    validarDesconto(valorDesconto, valorDescontoPermitido);
  }

  validarDesconto(double valorDesconto, double descontoPermitido) {
    if (valorDesconto > descontoPermitido) {
      throw Exception('Desconto não permitido');
    }
  }
}
