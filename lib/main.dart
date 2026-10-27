import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(home: FormularioExemplo()),
);

class FormularioExemplo extends StatefulWidget {
  const FormularioExemplo({super.key});

  @override
  State<FormularioExemplo> createState() =>
      _FormularioExemploState();
}

// Modelo de Dados do Pet
class Pet {
  final String nome;
  final String especie;
  final int idade;
  final bool eCastrado;

  Pet({
    required this.nome,
    required this.especie,
    required this.idade,
    required this.eCastrado,
  });
}

class _FormularioExemploState extends State<FormularioExemplo> {
  final List<Pet> _petsCadastrados = [];
  final _formKey = GlobalKey<FormState>();

  final _nomepet = TextEditingController();
  final _idadepet = TextEditingController();

  String? _especieSelecionada;
  bool _aceitouTermos = false;
  bool _eCastrado = false;

  void _submeterFormulario() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_aceitouTermos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aceite os termos para continuar!'),
        ),
      );
      return;
    }

    setState(() {
      _petsCadastrados.add(
        Pet(
          nome: _nomepet.text.trim(),
          especie: _especieSelecionada!,
          idade: int.parse(_idadepet.text),
          eCastrado: _eCastrado,
        ),
      );
    });

    _limparFormulario();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pet cadastrado com sucesso!'),
      ),
    );
  }

  void _limparFormulario() {
    _formKey.currentState!.reset();
    _nomepet.clear();
    _idadepet.clear();

    setState(() {
      _especieSelecionada = null;
      _aceitouTermos = false;
      _eCastrado = false;
    });
  }

  @override
  void dispose() {
    _nomepet.dispose();
    _idadepet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Rápido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomepet,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Nome do pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome do pet!';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _especieSelecionada,
                decoration: const InputDecoration(
                  labelText: 'Informe a espécie',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'gato',
                    child: Text('Gato'),
                  ),
                  DropdownMenuItem(
                    value: 'cachorro',
                    child: Text('Cachorro'),
                  ),
                  DropdownMenuItem(
                    value: 'passarinho',
                    child: Text('Passarinho'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _especieSelecionada = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Selecione a espécie!';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _idadepet,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Idade do pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe a idade do pet!';
                  }

                  final idade = int.tryParse(value);

                  if (idade == null || idade < 0) {
                    return 'Digite uma idade válida!';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              CheckboxListTile(
                title: const Text('O pet é castrado?'),
                value: _eCastrado,
                onChanged: (novoValor) {
                  setState(() {
                    _eCastrado = novoValor ?? false;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text('Aceito os termos'),
                value: _aceitouTermos,
                onChanged: (novoValor) {
                  setState(() {
                    _aceitouTermos = novoValor ?? false;
                  });
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submeterFormulario,
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 24),

              const Text(
                'Pets cadastrados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (_petsCadastrados.isEmpty)
                const Text('Nenhum pet cadastrado.'),

              ..._petsCadastrados.map(
                (pet) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text(pet.nome),
                    subtitle: Text(
                      'Espécie: ${pet.especie}\n'
                      'Idade: ${pet.idade} anos\n'
                      'Castrado: ${pet.eCastrado ? "Sim" : "Não"}',
                    ),
                    isThreeLine: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}