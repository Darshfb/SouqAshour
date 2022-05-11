import 'dart:async';
import 'package:ashour/Layout/cubit/category_cubit.dart';
import 'package:ashour/Layout/cubit/category_states.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/services/repositories/category_repository.dart';
import 'package:ashour/services/web_service/category_web_service.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../CategoryProducts/product_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  int? totalElement;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AshourCubit(CategoryRepository(CategoryWebServices()))..getCategories(),
      child: BlocConsumer<AshourCubit, AshourStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = BlocProvider.of<AshourCubit>(context);
          return ConditionalBuilder(
              condition: cubit.categories.isNotEmpty,
              builder: (BuildContext context) =>
                  CustomPullToRefreshAndLoading(
                    onRefresh: ()async{
                      final result = cubit.getCategories(isRefresh: true);
                      if (result) {
                        await Future.delayed(const Duration(milliseconds: 1000));
                        _refreshController.refreshCompleted();
                      } else {
                        _refreshController.refreshFailed();
                      }
                    },
                    onLoad: ()async{
                      final result = cubit.getCategories(isRefresh: false);
                      if (result) {
                        await Future.delayed(const Duration(milliseconds: 1000));
                        _refreshController.loadComplete();
                      } else {
                        _refreshController.loadNoData();
                      }
                    },
                    controller: _refreshController,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.categories.length +1,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 1),
                      itemBuilder: (context, index)
                      {
                        if (index < cubit.categories.length)
                        {
                          return Card(
                            shadowColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                navigateTo(
                                    context: context,
                                    widget: ProductItemScreen(
                                      id: cubit
                                          .categories[index].id!,
                                      title: cubit.categories[index].categoryNameAr,
                                    ));
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Image.asset(
                                      'assets/images/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      cubit.categories[index].categoryNameEn
                                          .toString(),
                                      style:
                                      Theme.of(context).textTheme.subtitle2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }else{
                          return Container();
                        }
                      },
                    ),
                  ),
              fallback: (BuildContext context) => CustomPorgressIndicator());
        },
      ),
    );
  }
}
