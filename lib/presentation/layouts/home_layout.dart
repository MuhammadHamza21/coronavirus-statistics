import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/cases_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          body: AppCubit.get(context).screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                title: Text('Global'),
                icon: Icon(
                  Icons.public,
                ),
              ),
              BottomNavigationBarItem(
                title: Text('All Countries'),
                icon: Icon(
                  Icons.menu,
                ),
              ),
              BottomNavigationBarItem(
                title: Text('Search'),
                icon: Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
