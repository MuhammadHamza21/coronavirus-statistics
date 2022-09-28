import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/country_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value) {
                    cubit.getSearchedCountriesData(iso: value.toLowerCase());
                  },
                  cursorColor: Colors.purple,
                  decoration: const InputDecoration(
                    hintText: 'Type Country Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (cubit.searchedCountriesList.isNotEmpty)
                ListView.builder(
                  itemBuilder: (context, index) {
                    return CountryWidget(
                        country: cubit.searchedCountriesList[index]);
                  },
                  itemCount: cubit.searchedCountriesList.length,
                ),
            ],
          );
        },
        listener: (context, state) {});
  }
}
