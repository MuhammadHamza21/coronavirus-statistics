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
  Map<String, dynamic> globalList = {};
  List<dynamic> allCountriesList = [];
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
      globalList = value.data;
      emit(GetGlobalDataSucssesState());
      print('List is $globalList');
    }).catchError((onError) {
      print('Error while fitching data/////${onError.toString()}');
    });
    //print('List is $globalList');

    // var value = DioHelper.getData(
    //   url: global,
    // );

    // print('here ${value.toString()}');
  }

  void getAllCountriesData() {
    emit(GetAllCountriesDataLoadingState());
    DioHelper.getData(
      url: allCountries,
    ).then((value) {
      allCountriesList = value.data;
      emit(GetAllCountriesDataSucssesState());
    }).catchError((onError) {
      print('Error while fitching data/////${onError.toString()}');
    });
  }

  void getSpecificCountryData({required String iso}) {
    emit(GetSearchDataLoadingState());
    DioHelper.getData(
      url: '${allCountries}${iso}',
    ).then((value) {
      searchedCountry = {};
      searchedCountry = value.data;
      emit(GetSearchDataSucssesState());
    }).catchError((onError) {
      print('Error while fitching data/////${onError.toString()}');
    });
  }
}
