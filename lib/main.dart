import 'package:ashour/Layout/ashour_layout.dart';
import 'package:ashour/Layout/cubit/category_cubit.dart';
import 'package:ashour/Shared/Local/cache_helper.dart';
import 'package:ashour/services/repositories/category_repository.dart';
import 'package:ashour/services/web_service/category_web_service.dart';
import 'package:ashour/Shared/Network/dio_helper.dart';
import 'package:ashour/Shared/constant/const.dart';
import 'package:ashour/Shared/styles/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  getToken = await CacheHelper.getData(key: TOKEN.toString());
  print(getToken);
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
    fallbackLocale: const Locale('en', 'US'),
    child: MyApp(
      categoryRepository: CategoryRepository(CategoryWebServices()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  CategoryRepository categoryRepository;
  MyApp({Key? key, required this.categoryRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (BuildContext context) => AshourCubit(),
        // ),
        BlocProvider(
          create: (BuildContext context) =>
              AshourCubit(categoryRepository)..getCategories()
                // ..getProductID(),
        )
      ],
      child: MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          title: 'Souq Ashour',
          theme: lightTheme,
          darkTheme: darkTheme,
          home:AshourLayout()
          //CategoryTest()
          // CategoryScreen()
          //CategoryTest()
          //AshourLayout(),
          //ProductItemScreen(id: 12),
          //CategoryTest()
          //AshourLayout()
          //CategoryScreenHA()
          //CharactersScreen()
          //CategoriesScreen(),
          //PostsViews()

          //ScrollNotificationController()
          //const MyHomePage(title: 'Lazy Load Demo'),

          //AshourLayout(),
          //RegisterScreen(),
          //AshourLayout(),
          //   PinCode(),
          //LoginScreen(),
          ),
    );
  }
}
