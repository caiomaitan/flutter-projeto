import 'package:flutter/material.dart';
import '../models/receita.dart';

class FavoritosProvider with ChangeNotifier {
  final List<Receita> _favoritos = [];

  List<Receita> get favoritos => _favoritos;

  void adicionar(Receita receita) {
    _favoritos.add(receita);
    notifyListeners();
  }

  void remover(Receita receita) {
    _favoritos.remove(receita);
    notifyListeners();
  }

  bool contem(Receita receita) {
    return _favoritos.contains(receita);
  }

  void alternarFavorito(Receita receita) {
    if (contem(receita)) {
      remover(receita);
    } else {
      adicionar(receita);
    }
  }
}
