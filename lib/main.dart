import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/network/dio_helper.dart';
import 'package:coronavirus_statistics/shared/methods/check_connectivity.dart';

import 'presentation/layouts/home_layout.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  bool connectivity = await checkConnectivity();
  runApp(MainApp(connectivity: connectivity));
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
    required this.connectivity,
  }) : super(key: key);
  final bool connectivity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getGlobalData(),
      child: BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: HomeLayout(connectivity: connectivity),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
