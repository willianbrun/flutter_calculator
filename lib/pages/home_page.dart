import 'package:flutter/material.dart';

import '../entities/calculo.dart';
import '../widgets/botao_app.dart';
import '../widgets/mensagem_app.dart';

const List<String> ops = <String>[
  'Somar',
  'Subtrair',
  'Multiplicar',
  'Dividir'
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = ops.first;

  List<Calculo> calculos = [];
  Calculo calculoAtual = Calculo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      controller: controller1,
                      decoration: const InputDecoration(
                        hintText: 'Valor 1',
                        labelText: 'Valor 1',
                        labelStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown,
                            width: 3.0,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o valor 1';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          calculoAtual.input1 = double.parse(value!),
                    ),
                    TextFormField(
                      controller: controller2,
                      decoration: const InputDecoration(
                        hintText: 'Valor 2',
                        labelText: 'Valor 2',
                        labelStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown,
                            width: 3.0,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o valor 2';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          calculoAtual.input2 = double.parse(value!),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          calculoAtual.operation = ops.indexOf(value!);
                        });
                      },
                      items: ops.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    BotaoApp(
                        titulo: 'Calcular',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            setState(() {
                              calculoAtual.calculate();
                              calculos.add(calculoAtual);
                            });

                            controller1.clear();
                            controller2.clear();
                            FocusScope.of(context).unfocus();

                            MensagemApp(
                                context,
                                'Cálculo realizado com sucesso!!',
                                Colors.green);
                          }
                        }),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: calculos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        calculos[index].formula!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(calculos[index].result!.toString()),
                      leading: Icon(calculos[index].icon),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            calculos.removeAt(index);
                          });

                          MensagemApp(context, 'Cálculo excluído com sucesso!!',
                              Colors.greenAccent);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
