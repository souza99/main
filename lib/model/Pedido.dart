import 'package:main/entidade/Item.dart';
import 'package:main/entidade/cupom.dart';
import 'package:main/model/ValidarCpf.dart';

import 'package:main/model/ValidarCpf.dart';

void main() {}

var itens = <Object>[];

var totalCarrinho = 0.0;

class Pedido {
  Pedido({required String CPF}) {
    ValidarCPF validarCPF = ValidarCPF();
    validarCPF.ehVazio(CPF);
  }

  verifyThatHave3Orders(dynamic orders) {}

  void addItem({
    required Item item,
    required Cupom cupom,
    required int quantidade,
  }) {
    var descontoPermitidoPorItem =
        item.precoUnidade! * cupom.valorDescontoPermitido;
    // validarDesconto(cupom.valorDesconto, descontoPermitidoPorItem);
    var totalPorItem =
        calcularItemComDesconto(cupom.valorDesconto, item.precoUnidade!);

    var totalItens = calculaTotalItens(item.quantidade, totalPorItem);

    var existe = false;

    for (var contador = 0; contador < itens.length; contador++) {
      var itemLista = itens[contador] as List<Object>;
      if (itemLista[0] == item.nomeProduto) {
        itemLista[1] = item.quantidade + int.parse(itemLista[1].toString());
        existe = true;
        itens.add(itemLista);
        break;
      }
    }

    if (!existe) {
      itens.add([item.nomeProduto, item.quantidade, item.precoUnidade]);
    }

    calcularValorCarrinho(totalItens, cupom.valorDesconto);
  }

  calcularValorCarrinho(double totalItens, double desconto) {
    totalCarrinho += totalItens - desconto;
  }

  getValorCarrinho() {
    return totalCarrinho;
  }

  int contarItem() {
    return itens.length;
  }

  calculaTotalItens(int quantidade, double precoUnidade) {
    return quantidade * precoUnidade;
  }

  calcularItemComDesconto(double descontoReais, double precoUnidade) {
    return precoUnidade - descontoReais;
  }

  validarDesconto(double desconto, double descontoPermitido) {
    if (desconto > descontoPermitido)
      throw Exception('Desconto maior do que o permitido');
  }
}
