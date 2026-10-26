import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FormularioExemplo()));

class FormularioExemplo extends StatefulWidget {
  const FormularioExemplo({super.key});

  @override
  State<FormularioExemplo> createState() => _FormularioExemploState();
}

class _FormularioExemploState extends State<FormularioExemplo> {
  final _formKey = GlobalKey<FormState>();
  final _nomepet = TextEditingController();
  final _expeciepet = TextEditingController();
  final _termocastracao = TextEditingController();
  final _idadepet = TextEditingController();
  bool _aceitouTermos = false;

  void _submeterFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('pet cadastrado com sucesso {$_nomepet}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro Rápido')),
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
                  labelText: 'nome do pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null  ) {
                    return 'Informe um nome do pet válido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
              decoration: const InputDecoration(
              labelText: 'informe a especie',
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
              child: Text('passarinho'),

              ),
              ],
              onChanged: (value) { /* Ação */ },
              validator: (value) =>
              value == null ? 'Selecione...' : null,
              ),

              TextFormField(
                controller: _idadepet,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'idade',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'aAidade mnão pode ser nula';  
                  }
                  if (value != null){
                    if(int.tryParse (value)! > 0){
                      return 'A idade do pet precisa ser maior que 0';
                    }
                  }
                  return null;
                  }
              ),
              
              // Construção do Widget
              CheckboxListTile(
              title: const Text('Aceito termos'),
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
            ],
          ),
        ),
      ),
    );
  }
}