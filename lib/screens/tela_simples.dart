import 'package:flutter/material.dart';

class TelaSimples extends StatelessWidget {
  const TelaSimples({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x37236525),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.blue, width: 75, height: 75),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.red, width: 150, height: 150),
              Container(color: Colors.blue, width: 75, height: 75),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(color: Colors.yellow, width: 50, height: 50),
              Container(color: Colors.pinkAccent, height: 50, width: 50),
              Container(color: Colors.cyan, width: 50, height: 50),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300000,
            child: Text(
              'Diamante bruto',
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // print('tu aperto o botão');
            },
            child: Text('aperte o botão'),
          ),
        ],
      ),
    );
  }
}
