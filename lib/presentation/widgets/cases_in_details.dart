import 'package:coronavirus_statistics/Models/country_model.dart';
import 'package:flutter/material.dart';
import 'cases_number_widget.dart';

class CasesInDetails extends StatelessWidget {
  final CountryModel list;
  const CasesInDetails({
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CasesNumberWidget(
            mainTitle: 'Total Cases',
            numOfCases: list.cases,
            color: Colors.blueAccent,
          ),
          CasesNumberWidget(
            mainTitle: 'Today Cases',
            numOfCases: list.todayCases,
            color: Colors.blueAccent,
          ),
          CasesNumberWidget(
            mainTitle: 'Active',
            numOfCases: list.active,
            color: Colors.blueAccent,
          ),
          CasesNumberWidget(
            mainTitle: 'Total Recovered',
            numOfCases: list.recovered,
            color: Colors.green,
          ),
          CasesNumberWidget(
            mainTitle: 'Today Recovered',
            numOfCases: list.todayRecovered,
            color: Colors.green,
          ),
          CasesNumberWidget(
            mainTitle: 'Total Deaths',
            numOfCases: list.deaths,
            color: Colors.red,
          ),
          CasesNumberWidget(
            mainTitle: 'Today Deaths',
            numOfCases: list.todayDeaths,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
