import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
/* <<<<<<<<<<<<<<  ✨ Windsurf Command 🌟 >>>>>>>>>>>>>>>> */
        // Este SingleChildScrollView serve para que o teclado n o cubra a tela
        // quando o usu rio est  editando um campo de texto. Isso acontece
        // porque o teclado pode ser mais alto que a altura da tela, e o
        // SingleChildScrollView permite que o usu rio role a tela para cima
        // e continue editando o campo de texto mesmo que o teclado esteja
        // cobrindo parte da tela.
        child: SingleChildScrollView(
          /* <<<<<<<<<<  0804e636-cc69-4974-80ee-c3296e065841  >>>>>>>>>>> */
          child: Container(
            height: 750,
            width: 375,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: difficultyController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Dificuldade',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    onChanged: (text) {
                      setState(() {
                        imageController.text = text;
                      });
                    },
                    controller: imageController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Imagem',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.blue),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageController.text,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (
                            BuildContext context,
                            Object exception,
                            StackTrace? stackTrace,
                          ) {
                            return Image.asset('assets/images/nophoto.png');
                          },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(int.parse(difficultyController.text));
                    print(imageController.text);
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
