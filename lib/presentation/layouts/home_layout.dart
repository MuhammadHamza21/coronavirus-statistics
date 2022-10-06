import 'package:coronavirus_statistics/presentation/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    Key? key,
    required this.connectivity,
  }) : super(key: key);
  final bool connectivity;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return widget.connectivity
        ? BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
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
                      label: 'Global',
                      icon: Icon(
                        Icons.public,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'All Countries',
                      icon: Icon(
                        Icons.menu,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Search',
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                  ],
                ),
              );
            },
            listener: (context, state) {},
          )
        : const Scaffold(
            body: ErrorMessageWidget(
              errorMessage: 'No Internet Connection.',
            ),
          );
  }
}
