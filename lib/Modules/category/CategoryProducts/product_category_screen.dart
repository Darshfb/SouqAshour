import 'package:ashour/Layout/cubit/category_cubit.dart';
import 'package:ashour/Layout/cubit/category_states.dart';
import 'package:ashour/Modules/category/Category_product_item/product_item.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:ashour/services/repositories/category_repository.dart';
import 'package:ashour/services/web_service/category_web_service.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItemScreen extends StatelessWidget {
  ProductItemScreen({Key? key, required this.id, this.title}) : super(key: key);
  final int id;
  final String? title;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AshourCubit(CategoryRepository(CategoryWebServices()))
            ..getProductByID(id: id),
      child: BlocConsumer<AshourCubit, AshourStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AshourCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                (title != null) ? title! : "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ConditionalBuilder(
                condition: cubit.products.isNotEmpty,
                fallback: (BuildContext context) => const Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (BuildContext context) =>
                    CustomPullToRefreshAndLoading(
                  controller: cubit.refreshController,
                  onRefresh: () async {
                    final result =
                        cubit.getProductByID(id: id, isRefresh: true);
                    if (result) {
                      await Future.delayed(
                          const Duration(milliseconds: 1000));
                      cubit.refreshController.refreshCompleted();
                    } else {
                      cubit.refreshController.refreshFailed();
                    }
                  },
                  onLoad: () async {
                    if (cubit.getProductByID(id: id, isRefresh: false)) {
                      await Future.delayed(
                          const Duration(milliseconds: 1000));
                      cubit.refreshController.loadComplete();
                    } else {
                      cubit.refreshController.loadNoData();
                    }
                  },
                  child: GridView.builder(
                      itemCount: cubit.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .9),
                      itemBuilder: (context, index) {
                        if (index < cubit.products.length) {
                          return InkWell(
                            onTap: (){
                              navigateTo(context: context, widget: ProductItem(productId: cubit.products[index].id!, title: cubit.products[index].productNameAr!,));
                            },
                            child: Hero(
                              tag: cubit.products[index].id!,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                                elevation: 10,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/img_1.png',
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      cubit.products[index].productNameAr
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(cubit.products[index].price.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart, color: Colors.grey,)),
                                        IconButton(onPressed: (){}, icon: const Icon(IconBroken.heart, color: Colors.grey,))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
