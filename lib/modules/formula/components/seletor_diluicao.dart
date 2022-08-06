import 'package:flutter/material.dart';

class SeletorDiluicao extends StatelessWidget {
  final String tipo;
  final VoidCallback onTap;
  final bool isCheked;
  const SeletorDiluicao(
      {Key? key,
      required this.tipo,
      required this.onTap,
      required this.isCheked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 1),
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tipo.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
              Visibility(
                visible: isCheked,
                child: const Icon(
                  Icons.check_outlined,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
