import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String imagem;
  final int dificuldade;

  const Task(this.nome, this.imagem, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(widget.imagem, fit: BoxFit.cover),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: obterCorIconeEstrela(0),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: obterCorIconeEstrela(1),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: obterCorIconeEstrela(2),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: obterCorIconeEstrela(3),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: obterCorIconeEstrela(4),
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              size: 24,
                              color: Colors.white,
                            ),
                            Text(
                              'UP',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: obterIndicadorProgressaoNivel(),
                        color: Colors.white,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível $nivel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Retorna um valor entre 0 e 1 que indica a progress o atingida pelo usuário no nível atual.
  ///
  /// Caso o [widget.dificuldade] seja maior que zero, retorna o resultado da divisão entre o
  /// [nivel] atual e o [widget.dificuldade], dividido por 10. Caso contrário, retorna 1.
  double obterIndicadorProgressaoNivel() {
    return widget.dificuldade > 0 ? (nivel / widget.dificuldade) / 10 : 1;
  }

  /// Retorna a cor que o [Icon] de uma estrela deve ter,
  /// baseado na [dificuldade] passada como par metro.
  ///
  /// Se o [widget.dificuldade] for maior do que a [dificuldade] passada, retorna [Colors.blue].
  /// Caso contrário, retorna [Colors.blue] com opacidade 100.
  ///
  Color? obterCorIconeEstrela(int dificuldade) {
    return widget.dificuldade > dificuldade ? Colors.blue : Colors.blue[100];
  }
}
