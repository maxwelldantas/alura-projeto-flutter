import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String nome;

  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(color: Colors.black26, width: 72, height: 100),
                    SizedBox(
                      width: 200,
                      child: Text(
                        nome,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_drop_up),
                    ),
                  ],
                ),
              ),
              Text(
                'Nível: 0',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
