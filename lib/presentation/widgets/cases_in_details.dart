import 'package:coronavirus_statistics/Models/country_model.dart';
import 'package:coronavirus_statistics/Models/global_model.dart';
import 'package:flutter/material.dart';
import 'cases_number_widget.dart';

class CasesInDetails extends StatelessWidget {
  final CountryModel? list;
  final GlobalModel? global;
  const CasesInDetails({
    this.list,
    this.global,
  });

  @override
  Widget build(BuildContext context) {
    return _casesInDetails(list ?? global);
  }

  Widget _casesInDetails(dynamic object) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CasesNumberWidget(
            mainTitle: 'Total Cases',
            numOfCases: object.cases,
            color: Colors.blueAccent,
          ),
          CasesNumberWidget(
            mainTitle: 'Today Cases',
            numOfCases: object.todayCases,
            color: Colors.blueAccent,
          ),
          CasesNumberWidget(
            mainTitle: 'Active',
            numOfCases: object.active,
            color: Colors.blueAccent,
          ),
          CasesNumberWidget(
            mainTitle: 'Total Recovered',
            numOfCases: object.recovered,
            color: Colors.green,
          ),
          CasesNumberWidget(
            mainTitle: 'Today Recovered',
            numOfCases: object.todayRecovered,
            color: Colors.green,
          ),
          CasesNumberWidget(
            mainTitle: 'Total Deaths',
            numOfCases: object.deaths,
            color: Colors.red,
          ),
          CasesNumberWidget(
            mainTitle: 'Today Deaths',
            numOfCases: object.todayDeaths,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
