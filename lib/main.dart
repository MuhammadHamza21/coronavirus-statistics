import 'package:bloc/bloc.dart';
import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/layouts/home_layout.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getGlobalData()
        ..getAllCountriesData(),
      child: BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: HomeLayout(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
