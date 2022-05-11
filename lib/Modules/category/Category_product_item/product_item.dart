import 'package:ashour/Modules/category/Category_product_item/cubit/cubit.dart';
import 'package:ashour/Modules/category/Category_product_item/cubit/states.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.productId, required this.title}) : super(key: key);

  int productId;
String? title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductItemCubit()..getProductItem(productId: productId),
      child: BlocConsumer<ProductItemCubit, ProductItemStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = ProductItemCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(title!),
              centerTitle: true,
            ),
            body: ConditionalBuilder(
                condition: state is ! LoadProductItemState,
                builder: (BuildContext context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 15,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                    height: 250,
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InteractiveViewer(
                                          child: Image.network(
                                            "https://www.incimages.com/uploaded_files/image/1920x1080/getty_80116649_344560.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                      itemCount: 3,
                                      pagination: const SwiperPagination(),
                                      control: const SwiperControl(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'In / out Stoke',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          cubit.productItemModel!.price
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          'SAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          child: CustomButton(
                                              onPressed: () {
                                                cubit.decreaseProductItem();
                                              },
                                              child: const Icon(Icons.minimize)),
                                        ),
                                        Card(
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 50.0,
                                              height: 45.0,
                                              child: Text(cubit.increaseInCart.toString())),
                                        ),
                                        Card(
                                          child: CustomButton(
                                              onPressed: () {
                                                cubit.increaseProductItem();
                                              },
                                              child: Icon(Icons.add)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('descriptionAr'),
                                    Text('descriptionAr'),
                                    Text('descriptionAr'),
                                    Text('descriptionAr'),
                                    Text('descriptionAr'),
                                    Text('descriptionAr'),
                                    Text('descriptionAr'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: CustomButton(
                                  backgroundColor: Colors.teal,
                                  height: 40,
                                  onPressed: () {},
                                  child: Text('Add to cart'),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                height: 40,
                                onPressed: () {},
                                child: Icon(IconBroken.heart),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                fallback: (context) => Center(child: CircularProgressIndicator(),)),
          );
        },
      ),
    );

    // const Center(child: Text('Home'));
  }
}
