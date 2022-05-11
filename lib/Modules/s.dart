// import 'dart:async';
// import 'package:ashour/Layout/cubit1/ashour_cubit.dart';
// import 'package:ashour/Layout/cubit1/ashour_states.dart';
// import 'package:ashour/Shared/component/component.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class ASKTEST extends StatelessWidget {
//   ASKTEST({Key? key}) : super(key: key);
//   final RefreshController _refreshController =
//   RefreshController(initialRefresh: false);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => AshourCubit(),
//       child: BlocConsumer<AshourCubit, AshourStates>(
//         listener: (BuildContext context, state) {},
//         builder: (BuildContext context, Object? state) {
//           var cubit1 = AshourCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(
//               title: IconButton(onPressed: (){
//                 //print(cubit1.categories.length.toString());
//                 print(cubit1.categoryModels!.size.toString());
//               }, icon: Icon(Icons.add),),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ConditionalBuilder(
//                       condition: cubit1.categories.isNotEmpty,
//                       builder: (BuildContext context) =>
//                           CustomPullToRefreshAndLoading(
//                             onRefresh: ()async{
//                               final result = cubit1.getCategories(isRefresh: true);
//                               if (result) {
//                                 await Future.delayed(const Duration(milliseconds: 1000));
//                                 _refreshController.refreshCompleted();
//                               } else {
//                                 _refreshController.refreshFailed();
//                               }
//                             },
//                             onLoad: ()async{
//                               final result = cubit1.getCategories(isRefresh: false);
//                               if (result) {
//                                 await Future.delayed(const Duration(milliseconds: 1000));
//                                 _refreshController.loadComplete();
//                               } else {
//                                 _refreshController.loadNoData();
//                               }
//                             },
//                             controller: _refreshController,
//                             child: GridView.builder(
//                               physics: const BouncingScrollPhysics(),
//                               itemCount: cubit1.categories.length +1,
//                               gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2, childAspectRatio: 1),
//                               itemBuilder: (context, index)
//                               {
//                                 if (index < cubit1.categories.length)
//                                 {
//                                   return Card(
//                                     shadowColor: Colors.deepOrange,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10.0)),
//                                     elevation: 5,
//                                     child: Column(
//                                       children: [
//                                         Expanded(
//                                           flex: 3,
//                                           child: Image.asset(
//                                             'assets/images/img_1.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: Text(
//                                             cubit1.categories[index].categoryNameEn
//                                                 .toString(),
//                                             style:
//                                             Theme.of(context).textTheme.subtitle2,
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }else{
//                                   return Container();
//                                 }
//                               },
//                             ),
//                           ),
//                       fallback: (BuildContext context) => CustomPorgressIndicator()),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
