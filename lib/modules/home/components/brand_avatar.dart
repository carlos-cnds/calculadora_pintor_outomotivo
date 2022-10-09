import 'package:pintando_carro/models/brand.dart';
import 'package:pintando_carro/shared/util/img_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandAvatar extends StatelessWidget {
  final Brand brand;
  const BrandAvatar({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CircleAvatar(
        backgroundColor: Color(0xffE8E8E8),
        radius: 40,
        child: CircleAvatar(
          radius: 37,
          backgroundColor: Colors.white,
          backgroundImage:
              MemoryImage(ImgUtil.dataFromBase64String(brand.imgBase64!)),
        ),
      ),
      onTap: () {
        Get.toNamed('formula/', arguments: {'brand': brand.name});
      },
    );
  }
}
