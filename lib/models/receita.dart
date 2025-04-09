class Receita {
  final String titulo;
  final String descricao;
  final String imagemUrl;
  final List<String> ingredientes;
  final List<String> modoPreparo;

  Receita({
    required this.titulo,
    required this.descricao,
    required this.imagemUrl,
    required this.ingredientes,
    required this.modoPreparo,
  });
}
