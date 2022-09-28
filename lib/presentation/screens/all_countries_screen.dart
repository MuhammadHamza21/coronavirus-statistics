import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/country_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCountriesScreen extends StatelessWidget {
  const AllCountriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return state is GetAllCountriesDataLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : cubit.allCountriesList.isEmpty
                  ? const Center(
                      child: Center(
                        child: Text(
                          'It looks like an error, please try again later!',
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return CountryWidget(
                            country: cubit.allCountriesList[index]);
                      },
                      itemCount: cubit.allCountriesList.length,
                    );
        },
        listener: (context, state) {});
  }
}
