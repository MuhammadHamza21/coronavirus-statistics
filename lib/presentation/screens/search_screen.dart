import 'dart:async';

import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/country_widget.dart';
import 'package:coronavirus_statistics/presentation/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? searchOnStoppedTyping;
  _onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    if (AppCubit.get(context).allCountriesList.isEmpty) {
      setState(
        () => searchOnStoppedTyping = Timer(
          duration,
          () => AppCubit.get(context).getSearchedCountriesData(iso: value),
        ),
      );
    } else {
      AppCubit.get(context).getSearchedCountriesData(iso: value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: _onChangeHandler,
                    cursorColor: Colors.purple,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchController.text = '';
                          cubit.emptySearchedCountriesList();
                        },
                        icon: const Icon(Icons.close),
                      ),
                      hintText: 'Type Country Name',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                (state is GetAllCountriesDataLoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is GetSearchedCountriesDataSucssesState
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CountryWidget(
                                country: cubit.searchedCountriesList[index],
                              );
                            },
                            itemCount: cubit.searchedCountriesList.length,
                          )
                        : state is GetSearchedCountriesDataErrorState
                            ? const ErrorMessageWidget()
                            : const Center(),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
