import 'package:coronavirus_statistics/Models/country_model.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/network/dio_helper.dart';
import 'package:coronavirus_statistics/presentation/screens/all_countries_screen.dart';
import 'package:coronavirus_statistics/presentation/screens/global_screen.dart';
import 'package:coronavirus_statistics/presentation/screens/search_screen.dart';
import 'package:coronavirus_statistics/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<CoronavirusStatisticsStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  CountryModel? globalList;
  List<CountryModel> allCountriesList = [];
  List<CountryModel> searchedCountriesList = [];
  Map<String, dynamic> searchedCountry = {};
  int currentIndex = 0;
  List<Widget> screens = const [
    GlobalScreen(),
    AllCountriesScreen(),
    SearchScreen(),
  ];
  List<String> titles = [
    'Global',
    'All Countries',
    'Search',
  ];
  void changeCurrentIndex(int newIndex) {
    currentIndex = newIndex;
    emit(ChangeCurrentIndexState());
  }

  void getGlobalData() {
    emit(GetGlobalDataLoadingState());
    DioHelper.getData(
      url: global,
    ).then((value) {
      print(value.data);
      globalList = CountryModel.fromJson(value.data);
      emit(GetGlobalDataSucssesState());
      print('List is $globalList');
    }).catchError((onError) {
      print('Error while fitching data/////${onError.toString()}');
    });
  }

  void getAllCountriesData() {
    allCountriesList = [];
    emit(GetAllCountriesDataLoadingState());
    DioHelper.getData(
      url: allCountries,
    ).then((value) {
      for (var i = 0; i < value.data.length; i++) {
        allCountriesList.add(CountryModel.fromJson(value.data));
      }
      print(allCountriesList.toString());
      emit(GetAllCountriesDataSucssesState());
    }).catchError((onError) {
      print('Error while fitching data/////${onError.toString()}');
    });
  }

  // void getSpecificCountryData({required String iso}) {
  //   emit(GetSearchDataLoadingState());
  //   DioHelper.getData(
  //     url: '${allCountries}${iso}',
  //   ).then((value) {
  //     searchedCountry = {};
  //     searchedCountry = value.data;
  //     emit(GetSearchDataSucssesState());
  //   }).catchError((onError) {
  //     print('Error while fitching data/////${onError.toString()}');
  //   });
  // }

  void getSearchedCountriesData({required String iso}) {
    emit(GetSearchedCountriesDataLoadingState());
    searchedCountriesList = allCountriesList
        .where((element) =>
            element.country!.toLowerCase().contains(iso) ||
            element.countryInfo!.iso2!.toLowerCase().contains(iso) ||
            element.countryInfo!.iso3!.toLowerCase().contains(iso))
        .toList();
    emit(GetSearchedCountriesDataSucssesState());
  }
}
