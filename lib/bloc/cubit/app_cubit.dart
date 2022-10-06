import 'package:coronavirus_statistics/Models/country_model.dart';
import 'package:coronavirus_statistics/Models/global_model.dart';
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
  GlobalModel? globalData;
  List<CountryModel> allCountriesList = [];
  List<CountryModel> searchedCountriesList = [];
  int currentIndex = 0;
  List<Widget> screens = [
    const GlobalScreen(),
    const AllCountriesScreen(),
    const SearchScreen(),
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
      globalData = GlobalModel.fromJson(value.data);
      emit(GetGlobalDataSucssesState());
    }).catchError((onError) {
      print('Error while fitching data/////${onError.toString()}');
      emit(GetGlobalDataErrorState(errorMessage: onError.toString()));
    });
  }

  Future getAllCountriesData() async {
    allCountriesList = [];
    emit(GetAllCountriesDataLoadingState());
    await DioHelper.getData(
      url: allCountries,
    ).then((value) {
      for (var i = 0; i < value.data.length; i++) {
        allCountriesList.add(CountryModel.fromJson(value.data[i]));
      }
      emit(GetAllCountriesDataSucssesState());
    }).catchError((onError) {
      emit(GetAllCountriesDataErrorState(errorMessage: onError.toString()));
      print(
          'Error while fitching data in all countries/////${onError.toString()}');
    });
  }

  void getSearchedCountriesData({required String iso}) async {
    searchedCountriesList = [];
    emit(GetSearchedCountriesDataLoadingState());
    if (allCountriesList.isEmpty) {
      await getAllCountriesData();
      if (allCountriesList.isNotEmpty) {
        searchedCountriesList = allCountriesList
            .where((element) => element.country!.toLowerCase().contains(iso))
            .toList();
        emit(GetSearchedCountriesDataSucssesState());
      } else {
        emit(GetSearchedCountriesDataErrorState());
      }
    } else {
      searchedCountriesList = allCountriesList
          .where((element) => element.country!.toLowerCase().contains(iso))
          .toList();
      emit(GetSearchedCountriesDataSucssesState());
    }
  }

  void emptySearchedCountriesList() {
    searchedCountriesList = [];
    emit(EmptySearchedCountriesList());
  }
}
