import 'package:flutter/material.dart';

class EmptBrandData extends StatelessWidget {
  const EmptBrandData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.science,
            color: Colors.black54,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Estamos trabalhando nas fórmulas e itens desta marca. Mais tarde saia e entre no app novamente para atualizar!",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
