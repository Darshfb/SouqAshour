import 'package:ashour/Layout/cubit/category_cubit.dart';
import 'package:ashour/Layout/cubit/category_states.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AshourLayout extends StatelessWidget {
  AshourLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AshourCubit, AshourStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AshourCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Hi'),
                SizedBox(
                  width: 5.0,
                ),
                Text('Name!'),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(IconBroken.notification)),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return cubit.screens[cubit.currentIndex];
              } else {
                return buildOfflineWidget();
              }
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          //cubit.screens[cubit.currentIndex]
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.bottomNavBar(value);
              },
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.category), label: 'Category'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.opencart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.profile), label: 'Profile'),
              ]),
        );
      },
    );
  }

  Widget buildOfflineWidget() {
    return Center(
      child: Container(
        height: 320,
        width: 320,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Can\'t connect... check your internet',
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            const SizedBox(height: 10,),
            SvgPicture.asset(
              'assets/images/check_internet.svg',
              height: 150,
              width: 150,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
