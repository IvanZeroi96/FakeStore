import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore/controller/home/home_controller.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/ui/circular_progress.dart';
import 'package:fakestore/view/ui/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              Utils().imageLogoAsset,
              width: 50,
              height: 50,
            ),
            actions: [
              IconButton(
                onPressed: () => _.onChangeAsc(),
                icon: _.isAsc
                    ? const Icon(
                        Icons.arrow_upward,
                      )
                    : const Icon(Icons.arrow_downward),
              )
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  onTap: () => _.onCloseSession(),
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Cerrar sesión'),
                          Icon(Icons.logout_outlined),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: ProgressHUD(
            loading: _.isLoading,
            child: SafeArea(
              child: GetBuilder<HomeController>(
                id: 'ListProducts',
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  width: double.maxFinite,
                                  height: 130.0,
                                  fit: BoxFit.scaleDown,
                                  imageUrl: _.products[index].image!,
                                  placeholder: (context, url) => SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgress(
                                        width: 20,
                                        height: 20,
                                      )),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/images/sinimagen.png',
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ListTile(
                                  subtitle: Text(_.products[index].title!,
                                      style: const TextStyle()
                                          .copyWith(fontSize: 12)),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '\$${_.products[index].price.toString()}',
                                          textAlign: TextAlign.right),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        );
      },
    );
  }
}
