// import 'package:ashour/Modules/category/cubit1/category_cubit.dart';
// import 'package:ashour/Modules/category/cubit1/category_states.dart';
// import 'package:ashour/Shared/component/component.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class CategoryTest extends StatelessWidget {
//   CategoryTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CategoryCubit, CategoryStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit1 = CategoryCubit.get(context);
//         return Scaffold(
//             appBar: AppBar(
//               title: IconButton(
//                   onPressed: () {
//                     print(cubit1.categories.length.toString());
//                   },
//                   icon: Icon(Icons.add)),
//             ),
//             body: ConditionalBuilder(
//               condition: cubit1.categories.isNotEmpty,
//               fallback: (BuildContext context) => CustomPorgressIndicator(),
//               builder: (BuildContext context) {
//                 return SmartRefresher(
//                   enablePullUp: true,
//                   enablePullDown: true,
//                   controller: cubit1.refreshController,
//                   header: WaterDropHeader(),
//                   footer: CustomFooter(
//                     builder: (BuildContext context, LoadStatus? mode) {
//                       Widget body;
//                       if (mode == LoadStatus.loading) {
//                         body = CupertinoActivityIndicator();
//                       } else if (mode == LoadStatus.failed) {
//                         body = Text("Load Failed!Click retry!");
//                       } else if (mode == LoadStatus.canLoading) {
//                         body = Text("release to load more");
//                       } else if (mode == LoadStatus.noMore) {
//                         body = Text("No more data");
//                       } else {
//                         body = Text("No more data");
//                       }
//                       return Container(
//                         height: 55.0,
//                         child: Center(child: body),
//                       );
//                     },
//                   ),
//                   onRefresh: () async {
//                     // cubit1.getProductByID();
//                     print(cubit1.categories.length.toString());
//                     final result = cubit1.getAllCategories(isRefresh: true);
//                     if (cubit1.getAllCategories(isRefresh: true)) {
//                       await Future.delayed(const Duration(milliseconds: 1000));
//                       cubit1.refreshController.refreshCompleted();
//                     } else {
//                       cubit1.refreshController.refreshFailed();
//                     }
//                   },
//                   onLoading: () async {
//                     print(cubit1.categories.length.toString());
//                     final result =  cubit1.getProductByID(isRefresh: false);
//                     if (cubit1.getAllCategories(isRefresh: false)) {
//                       await Future.delayed(const Duration(milliseconds: 1000));
//                       cubit1.refreshController.loadComplete();
//                     } else {
//                       cubit1.refreshController.loadNoData();
//                     }
//                   },
//                   child:
//                   ListView.separated(
//                       itemBuilder: (context, index) {
//                         print(index.toString());
//                         if (index < cubit1.categories.length) {
//                           return Column(
//                             children: [
//                               Text('${cubit1.categories[index].categoryNameAr}'),
//                               IconButton(
//                                   onPressed: () {
//                                     cubit1.getProductByID();
//                                   },
//                                   icon: Icon(Icons.add))
//                             ],
//                           );
//                         } else {
//                           return Container();
//                         }
//                       },
//                       separatorBuilder: (context, index) => Divider(),
//                       itemCount: cubit1.categories.length + 1),
//
//
//
//
//                   // GridView.builder(
//                   //     itemCount: cubit1.categories.length +1,
//                   //     gridDelegate:
//                   //     const SliverGridDelegateWithFixedCrossAxisCount(
//                   //         crossAxisCount: 1,
//                   //         childAspectRatio: 1.5
//                   //     ),
//                   //     itemBuilder: (context, index) {
//                   //       print(index.toString());
//                   //       if (index < cubit1.categories.length)
//                   //       {
//                   //         return Card(
//                   //           shape: RoundedRectangleBorder(
//                   //               borderRadius: BorderRadius.circular(10.0)),
//                   //           elevation: 10,
//                   //           child: Column(
//                   //             children: [
//                   //               Expanded(
//                   //                 flex: 3,
//                   //                 child: Image.asset(
//                   //                   'assets/images/img_1.png',
//                   //                   fit: BoxFit.cover,
//                   //                 ),
//                   //               ),
//                   //               Expanded(
//                   //                 flex: 1,
//                   //                 child: Text(
//                   //                   cubit1.categories[index].categoryNameAr
//                   //                       .toString(),
//                   //                   style:
//                   //                   Theme.of(context).textTheme.subtitle2,
//                   //                   textAlign: TextAlign.center,
//                   //                 ),
//                   //               ),
//                   //             ],
//                   //           ),
//                   //         );
//                   //       } else{
//                   //         return Container();
//                   //       }
//                   //     }),
//
//
//
//
//
//
//
//                     // GridView.builder(
//                     //     itemCount: cubit1.products.length +1,
//                     //     gridDelegate:
//                     //     const SliverGridDelegateWithFixedCrossAxisCount(
//                     //         crossAxisCount: 1,
//                     //         childAspectRatio: 1.5
//                     //     ),
//                     //     itemBuilder: (context, index) {
//                     //       print(index.toString());
//                     //       if (index < cubit1.products.length)
//                     //       {
//                     //         return Card(
//                     //           shape: RoundedRectangleBorder(
//                     //               borderRadius: BorderRadius.circular(10.0)),
//                     //           elevation: 10,
//                     //           child: Column(
//                     //             children: [
//                     //               Expanded(
//                     //                 flex: 3,
//                     //                 child: Image.asset(
//                     //                   'assets/images/img_1.png',
//                     //                   fit: BoxFit.cover,
//                     //                 ),
//                     //               ),
//                     //               Expanded(
//                     //                 flex: 1,
//                     //                 child: Text(
//                     //                   cubit1.products[index].productNameAr
//                     //                       .toString(),
//                     //                   style:
//                     //                   Theme.of(context).textTheme.subtitle2,
//                     //                   textAlign: TextAlign.center,
//                     //                 ),
//                     //               ),
//                     //             ],
//                     //           ),
//                     //         );
//                     //       } else{
//                     //         return Container();
//                     //       }
//                     //     })
//                     //
//                     //
//
//                 );
//               },
//             ));
//       },
//     );
//   }
// }
//
// // class CategoryScreen extends StatelessWidget {
// //   CategoryScreen({Key? key}) : super(key: key);
// //   double currentScrollOffset = 0;
// //   void setupScrollController(context) {
// //     final cubit1 = BlocProvider.of<CategoryCubit>(context);
// //     scrollController.addListener(() {
// //       /// Save current scroll position for the characters list only
// //       currentScrollOffset = scrollController.offset;
// //       if (scrollController.position.atEdge) {
// //         if (scrollController.position.pixels != 0) {
// //           cubit1.getAllCategories();
// //           if (!cubit1.isLoading) {
// //             cubit1.toggleIsLoading(true);
// //           }
// //           Timer(const Duration(milliseconds: 30), () {
// //             scrollController.jumpTo(scrollController.position.maxScrollExtent);
// //           });
// //         }
// //       }
// //     });
// //   }
// //   final scrollController = ScrollController();
// //   final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
// //   GlobalKey<LiquidPullToRefreshState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     setupScrollController(context);
// //     return BlocConsumer<CategoryCubit, CategoryStates>(
// //       listener: (BuildContext context, state) {},
// //       builder: (BuildContext context, Object? state) {
// //         var cubit1 = BlocProvider.of<CategoryCubit>(context);
// //         return Column(
// //           children: [
// //             Expanded(
// //               child: ConditionalBuilder(
// //                   condition: cubit1.categories.isNotEmpty,
// //                   builder: (BuildContext context) => LiquidPullToRefresh(
// //                     color: Colors.green,
// //                     animSpeedFactor: 5,
// //                     key: _refreshIndicatorKey,
// //                     onRefresh: () async {
// //                       cubit1.getAllCategories();
// //                     },
// //                     child: GridView.builder(
// //                       physics: const BouncingScrollPhysics(),
// //                       controller: scrollController,
// //                       itemCount: cubit1.categories.length +1,
// //                       gridDelegate:
// //                       const SliverGridDelegateWithFixedCrossAxisCount(
// //                           crossAxisCount: 2, childAspectRatio: 1),
// //                       itemBuilder: (context, index)
// //                       {
// //                         if (index < cubit1.categories.length)
// //                         {
// //                           return Card(
// //                             shadowColor: Colors.deepOrange,
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(10.0)),
// //                             elevation: 5,
// //                             child: InkWell(
// //                               onTap: () {
// //                                 navigateTo(
// //                                     context: context,
// //                                     widget: ProductItemScreen(
// //                                       id: cubit1
// //                                           .categories[index].id!,
// //                                     ));
// //                               },
// //                               child: Column(
// //                                 children: [
// //                                   Expanded(
// //                                     flex: 3,
// //                                     child: Image.asset(
// //                                       'assets/images/img_1.png',
// //                                       fit: BoxFit.cover,
// //                                     ),
// //                                   ),
// //                                   Expanded(
// //                                     flex: 1,
// //                                     child: Text(
// //                                       cubit1.categories[index].categoryNameEn
// //                                           .toString(),
// //                                       style:
// //                                       Theme.of(context).textTheme.subtitle2,
// //                                       textAlign: TextAlign.center,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         }else{
// //                           return Container();
// //                         }
// //                       },
// //                     ),
// //                   ),
// //                   fallback: (BuildContext context) => CustomPorgressIndicator()),
// //             ),
// //             // ListView.builder(
// //             //   controller: scrollController,
// //             //   itemCount: cubit1.categories.length + 1,
// //             //   // physics: const BouncingScrollPhysics(),
// //             //   itemExtent: 60,
// //             //   itemBuilder: (BuildContext context, int index) {
// //             //     if (index < cubit1.categories.length) {
// //             //       return Card(
// //             //           elevation: 5,
// //             //           child: Center(
// //             //               child: Text(cubit1.categories[index].categoryNameAr
// //             //                   .toString())));
// //             //     }
// //             //     return Container();
// //             //     // else {
// //             //     //   return const Padding(
// //             //     //     padding:  EdgeInsets.symmetric(vertical: 5),
// //             //     //     child:
// //             //     //     Center(
// //             //     //             child: CircularProgressIndicator(
// //             //     //                 color: Colors.black)),
// //             //     //   );
// //             //     // }
// //             //   },
// //             // ),
// //             // Expanded(
// //             //   child: ConditionalBuilder(
// //             //     condition: state is! LoadingGetAllCategory,
// //             //     fallback: (BuildContext context) => const Center(
// //             //       child: CircularProgressIndicator(),
// //             //     ),
// //             //     builder: (BuildContext context) => GridView.builder(
// //             //         itemCount: cubit1.categoryModels!.content.length,
// //             //         gridDelegate:
// //             //             const SliverGridDelegateWithFixedCrossAxisCount(
// //             //                 crossAxisCount: 2),
// //             //         itemBuilder: (context, index) {
// //             //           return Card(
// //             //             shape: RoundedRectangleBorder(
// //             //                 borderRadius: BorderRadius.circular(10.0)),
// //             //             elevation: 10,
// //             //             child: InkWell(
// //             //               onTap: () {
// //             //                 navigateTo(
// //             //                     context: context,
// //             //                     widget: ProductItemScreen(
// //             //                       id: cubit1
// //             //                           .categoryModels!.content[index].id!,
// //             //                     ));
// //             //               },
// //             //               child: Column(
// //             //                 children: [
// //             //                   Expanded(
// //             //                     flex: 3,
// //             //                     child: Image.asset(
// //             //                       'assets/images/img_1.png',
// //             //                       fit: BoxFit.cover,
// //             //                     ),
// //             //                   ),
// //             //                   Expanded(
// //             //                     flex: 1,
// //             //                     child: Text(
// //             //                       cubit1.categoryModels!.content[index]
// //             //                           .categoryNameEn
// //             //                           .toString(),
// //             //                       style:
// //             //                           Theme.of(context).textTheme.subtitle2,
// //             //                       textAlign: TextAlign.center,
// //             //                     ),
// //             //                   ),
// //             //                 ],
// //             //               ),
// //             //             ),
// //             //           );
// //             //         }),
// //             //   ),
// //             // ),
// //             // const SizedBox(
// //             //   height: 20.0,
// //             // ),
// //             // Container(
// //             //   alignment: Alignment.bottomCenter,
// //             //   child: NumberPagination(
// //             //       onPageChanged: (index) {
// //             //         cubit1.pageAble(index);
// //             //         print(index.toString());
// //             //       },
// //             //       pageTotal: cubit1.categoryModels!.totalPages!),
// //             // ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
