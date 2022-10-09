import 'package:pintando_carro/models/formula_item.dart';
import 'package:pintando_carro/modules/home/components/brand_avatar.dart';
import 'package:pintando_carro/modules/home/home_controller.dart';
import 'package:pintando_carro/shared/components/default_drawer.dart';
import 'package:pintando_carro/shared/constants.dart';
import 'package:pintando_carro/shared/local_repository/brand_repository.dart';
import 'package:pintando_carro/shared/local_repository/favorires_repository.dart';
import 'package:pintando_carro/shared/util/img_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pintando Carro"),
        centerTitle: true,
      ),
      drawer: DefaultDrawer(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: Hive.box('favorites').listenable(),
                  builder: (context, box, widget) {
                    List<Product> products = FavoriteRepository.getFavorites();
                    if (products.isNotEmpty) {
                      return Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            const Text("Itens Favoritos",
                                style: TextStyle(
                                  color: Color(0xff5c5c5c),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: products
                                  .map((favorite) => InkWell(
                                        onTap: () {
                                          Get.toNamed('formula/', arguments: {
                                            'product': favorite,
                                            'brand': favorite.brandName
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          decoration: const BoxDecoration(
                                              color: FILL_COLOR,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    const Color(0xffE8E8E8),
                                                radius: 30,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 27,
                                                  backgroundImage: MemoryImage(
                                                      ImgUtil
                                                          .getImageDataFromBrandName(
                                                              favorite
                                                                  .brandName!)),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      favorite.description!,
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff5C5C5C),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(favorite.formula!,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff888888),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  child: const Icon(
                                                      Icons.favorite,
                                                      color: Color(0xffcc2200)),
                                                  onTap: () {
                                                    FavoriteRepository
                                                        .removeFavorire(
                                                            product: favorite);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  }),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Selecionar Marca:",
                style: TextStyle(
                  color: Color(0xff5c5c5c),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Builder(builder: (context) {
                    var brands = BrandRepository.getLocal();
                    if (brands.isEmpty) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Não foi possível pegar as marcas cadastradas no nosso servidor. Talvez o problema seja por falha na conexão com a internet",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.refresh,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Atualizar",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              onPressed: () => controller.getData(),
                            )
                          ],
                        ),
                      );
                    }
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      children: brands
                          .map((brand) => Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: BrandAvatar(brand: brand!),
                              ))
                          .toList(),
                    );
                  }),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
