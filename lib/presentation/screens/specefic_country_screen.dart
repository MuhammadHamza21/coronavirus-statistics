import 'package:coronavirus_statistics/presentation/widgets/cases_in_details.dart';
import 'package:flutter/material.dart';

class SpecificCountry extends StatelessWidget {
  final Map<String, dynamic> country;
  SpecificCountry({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${country['country']}'),
      ),
      body: CasesInDetails(
        list: country,
      ),
    );
  }
}
