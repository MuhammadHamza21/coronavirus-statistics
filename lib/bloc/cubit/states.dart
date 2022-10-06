abstract class CoronavirusStatisticsStates {}

class AppInitialState extends CoronavirusStatisticsStates {}

class GetGlobalDataLoadingState extends CoronavirusStatisticsStates {}

class GetGlobalDataSucssesState extends CoronavirusStatisticsStates {}

class GetGlobalDataErrorState extends CoronavirusStatisticsStates {
  final String errorMessage;

  GetGlobalDataErrorState({required this.errorMessage});
}

class ChangeCurrentIndexState extends CoronavirusStatisticsStates {}

class GetAllCountriesDataSucssesState extends CoronavirusStatisticsStates {}

class GetAllCountriesDataLoadingState extends CoronavirusStatisticsStates {}

class GetSearchedCountriesDataErrorState extends CoronavirusStatisticsStates {}

class EmptySearchedCountriesList extends CoronavirusStatisticsStates {}

class GetAllCountriesDataErrorState extends CoronavirusStatisticsStates {
  final String errorMessage;

  GetAllCountriesDataErrorState({required this.errorMessage});
}

class GetSearchedCountriesDataSucssesState extends CoronavirusStatisticsStates {
}

class GetSearchedCountriesDataLoadingState extends CoronavirusStatisticsStates {
}
