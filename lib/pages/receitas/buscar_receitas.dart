import 'package:flutter/material.dart';
import '../../../models/receita.dart';
import '../../../widgets/receita_card.dart';

class BuscarReceitasPage extends StatefulWidget {
  final List<Receita> receitas;

  const BuscarReceitasPage({super.key, required this.receitas});

  @override
  State<BuscarReceitasPage> createState() => _BuscarReceitasPageState();
}

class _BuscarReceitasPageState extends State<BuscarReceitasPage> {
  final TextEditingController _searchController = TextEditingController();

  late List<Receita> _todasReceitas;
  List<Receita> _resultadosBusca = [];

  @override
  void initState() {
    super.initState();
    _todasReceitas = widget.receitas;
    _resultadosBusca = _todasReceitas;
  }

  void _buscarReceitas(String termo) {
    final resultados =
        _todasReceitas
            .where(
              (receita) =>
                  receita.titulo.toLowerCase().contains(termo.toLowerCase()),
            )
            .toList();

    setState(() {
      _resultadosBusca = resultados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Receitas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Digite o nome da receita',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _buscarReceitas(_searchController.text),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: _buscarReceitas,
            ),
          ),
          Expanded(
            child:
                _resultadosBusca.isEmpty
                    ? const Center(child: Text('Nenhuma receita encontrada.'))
                    : ListView.builder(
                      itemCount: _resultadosBusca.length,
                      itemBuilder: (context, index) {
                        return ReceitaCard(receita: _resultadosBusca[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
