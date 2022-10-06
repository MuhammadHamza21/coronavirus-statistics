import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/country_widget.dart';
import 'package:coronavirus_statistics/presentation/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  @override
  void initState() {
    AppCubit.get(context).getAllCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if (state is GetAllCountriesDataLoadingState &&
              cubit.allCountriesList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllCountriesDataSucssesState ||
              cubit.allCountriesList.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return CountryWidget(country: cubit.allCountriesList[index]);
              },
              itemCount: cubit.allCountriesList.length,
            );
          } else if (state is GetAllCountriesDataErrorState ||
              cubit.allCountriesList.isEmpty) {
            return const ErrorMessageWidget();
          }
          return const Center(
            child: Text('Unexpected error, Please try again later .'),
          );
        },
        listener: (context, state) {});
  }
}
