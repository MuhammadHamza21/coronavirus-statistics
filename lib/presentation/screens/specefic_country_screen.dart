import 'package:coronavirus_statistics/Models/country_model.dart';
import 'package:coronavirus_statistics/presentation/widgets/cases_in_details.dart';
import 'package:flutter/material.dart';

class SpecificCountry extends StatelessWidget {
  final CountryModel country;
  const SpecificCountry({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${country.country}'),
      ),
      body: CasesInDetails(
        list: country,
      ),
    );
  }
}
