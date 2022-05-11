// import 'package:ashour/Layout/cubit1/ashour_cubit.dart';
// import 'package:ashour/Layout/cubit1/ashour_states.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ScrollNotificationController extends StatefulWidget {
//   const ScrollNotificationController({Key? key}) : super(key: key);
//
//   @override
//   State<ScrollNotificationController> createState() =>
//       _ScrollNotificationControllerState();
// }
//
// class _ScrollNotificationControllerState
//     extends State<ScrollNotificationController> {
//
//   final ScrollController _scrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<AshourCubit>(context).loadAllCategory();
//     return BlocConsumer<AshourCubit, AshourStates>(
//       listener: (BuildContext context, state) {},
//       builder: (BuildContext context, Object? state) {
//         var cubit1 = AshourCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.teal,
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: NotificationListener<ScrollNotification>(
//                   onNotification: (ScrollNotification scrollInfo) {
//                     print((scrollInfo.metrics.maxScrollExtent - scrollInfo.metrics.pixels - scrollInfo.metrics.viewportDimension).round());
//                     final metrics = scrollInfo.metrics;
//                     final limits = metrics.maxScrollExtent - metrics.viewportDimension / 3;
//                     if (metrics.pixels >= limits && !cubit1.isLoading){
//                       cubit1.pageNo++;
//                       cubit1.loadAllCategory();
//                     }
//                     // if (!cubit1.isLoading && scrollInfo.metrics.atEdge &&
//                     //     (scrollInfo.metrics.maxScrollExtent - scrollInfo.metrics.pixels- scrollInfo.metrics.viewportDimension)
//                     //     .round() <= 200) {
//                     //   (!cubit1.categoryModels!.last!) ? cubit1.pageNo++ : null;
//                     //   cubit1.loadAllCategory();
//                     // }
//                     return true;
//                   },
//                   child: ConditionalBuilder(
//                     condition: state is! LoadingGetAllCategory,
//                     fallback: (BuildContext context) => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                     builder: (BuildContext context) {
//                       return ListView.builder(
//                         controller: _scrollController,
//                         physics: const AlwaysScrollableScrollPhysics(),
//                         itemCount: cubit1.categoryModels!.content.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Card(
//                             child: Container(
//                               height: 200,
//                               child: Center(
//                                 child: Text(cubit1.categoryModels!.content[index]
//                                     .categoryNameEn!),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
