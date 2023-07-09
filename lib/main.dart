
import 'package:chat/shared/bloc_observer/bloc_observer.dart';
import 'package:chat/shared/constants/constants.dart';
import 'package:chat/shared/network/local_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'layout/layout_cubit/layout_cubit.dart';
import 'layout/layout_screen.dart';
import 'modules/auth_screens/auth_cubit/auth_cubit.dart';
import 'modules/boarding_screens/boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  token = await CacheNetwork.getCacheData(key: 'token');
  password = await CacheNetwork.getCacheData(key: 'password');
  debugPrint("token is : $token");
  runApp(const MyApp());
}

class MyApp extends  StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MultiBlocProvider(
          providers:
          [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => LayoutCubit()..getCart()..getFavorites()..getBanners()..getCategories()..getProducts()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: token != null ? const LayoutScreen() :  const BoardingScreen()
          ),
        );
      },
    );
  }
}